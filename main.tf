######################################################################
# CI/CD Terraform
# az login
# az account show
# az account set --subscription="6b00c9ec-126b-4aa6-b3f6-bd6e4691ed9e"  
# az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/6b00c9ec-126b-4aa6-b3f6-bd6e4691ed9e"
# 
# terraform init
  // terraform init은 해당 명령어를 사용한 디렉토리를 기준으로 .tf 파일을 스캔한 후, 필요한 plugin을 확인
  // 필요한 plugin 목록을 정리한 후 .terraform 디렉토리를 만들고, releases.hashicorp.com로부터 필요한 plugin을 제공하는 provider 파일을 다운로드
# terraform validate   
  // 유효성검사 진행
# terraform plan
# terraform apply
# terraform destroy
# 
# https://docs.microsoft.com/ko-kr/azure/architecture/example-scenario/private-web-app/private-web-app
# https://hklee.azurewebsites.net/hostingstart.html

#https://docs.microsoft.com/ko-kr/azure/developer/terraform/
#https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs
######################################################################
# DevOps 사용방법
# 1. DevOps "organization"을 생성한다.
# 2. 생성한 organization에 "Project"를 생성한다.
# 3. Visual Studio Code에서 DevOps Git을 연결한다
# 4. 최초 소스를 Sync 한다. 이때 브랜치가 "master"로 되어 있다면 "main"으로 변경을 해야한다.
# master/slaves는 인종차별적 언어로 현재 main으로 변경되었음
# Visual Studio Code 확장으로 "Azure Terraform, Terraform, Argutec Azure Repos"를 설치
# >>>>> 여기까지가 Azure DevOps의 Git을 사용한 소스 관리
# >>>>> 이제부터 Pipelines을 이용한 CI/CD를 진행하면 됩니다.
# 5. Pipelines 구성시 Terraform이 사용할 Resource Group 생성 "rg-devops-hklee"
# >>>>> az group create --name "rg-devops-hklee" --location koreacentral
# 6. terraform에서 사용할 state 파일이 저장될 스토리지 제작
# >>>>> az storage account create --resource-group "rg-devops-hklee" --name "stoadevopshklee" --sku Standard_LRS --encryption-services blob
# container, file, queue, table 
# 7. 컨테이너 생성
# >>>>> 컨테이너는 파일 시스템의 디렉터리와 비슷한 BLOB 세트를 구성
# >>>>> az storage container create --name "tfstate" --account-name "stoadevopshklee" --account-key 
# 8. storage account 엑세스 키를 준비한다. : 4fgXelzuYonG9lRS8DuSjgOTbnSdYCMfvRRvwYopp2Qi2FTy0BKEA+v/D1sndefkwYgRsCmroIPYy+mHmjUVuQ==
# 9. Azure DevOps의 Pipelines 메뉴에서 "Create Pipelines"을 시작한다.
# 10. "Use the classic editor to create a pipeline without YAML."을 선택한다.
######################################################################

terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "=2.81.0"
        }
    }
}  
 
provider "azurerm" {
    //subscription_id = "b2cff5cc-4762-4423-9592-16e4a7e5f788"
    features {} 
} 

// 테라폼을 DevOps를 통해 배포시 상태값 저장을 위해 backend 구성해야 한다.
terraform {
  backend "azurerm" {
    resource_group_name = "rg-terraform-config-hklee"
    storage_account_name = "storageterraformconfig" 
    container_name       = "tfstate" 
    key                  = "8EPQV1txhFxf6vpxAcFkdd9/FXQqzZKhWYdQY7BoIqVCJq4ZECwH3DvMOPZL24Wghn66rI2lEc9+P/SoNnxtiA=="
  }
}

//################################################################
// Resource Group
//################################################################

// 리소스 그룹 생성
resource "azurerm_resource_group" "rg" {
	name = var.resource-group-name
	location = var.resource-group-location

    # 변수 사용
    # 동일폴더내 variables.tf 파일 생성후 변수 선언
    # 사용 : var.변수명
}


//################################################################
// Service
//################################################################

// App Service 생성
module "app" {
    source = "./modules/app"

    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location

    var-app-subnet-id = "${module.network.output-app-subnet-id}"
}

//################################################################
// Virtual Machine
//################################################################
  
// JumpBox용 단순 Virtual Machine 생성
module "vm" {
    source = "./modules/vm"

    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
 
    var-jp-subnet-id = "${module.network.output-jb-subnet-id}"
    var-jp-public-ip = "${module.network.output-public-pip[0]}"
} 

//################################################################
// Network(vnet, subnet)
//################################################################
 
// vnet 생성, subnet 생성, public ip 생성
# module 선언시 "모듈명" 지정
# source의 경우 경로명으로 지정
module "network" {
    source = "./modules/network"

    # module 사용시 module내 변수에 value 전달
    # module내 변수명 = var.변수명
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
}

// ER Gateway 생성
module "ergw" {
    source = "./modules/ergw"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
    var-ergw-subnet-id = "${module.network.output-ergw-subnet-id}"
    var-ergw-public-ip = "${module.network.output-public-pip[2]}"
}
  
// VPN 생성
module "vpn" {
    source = "./modules/vpn"

    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location

    var-vpn-subnet-id = "${module.network.output-vpn-subnet-id}"
    var-vpn-public-ip = "${module.network.output-public-pip[1]}"
}

//################################################################
// Database
//################################################################

// MS-SQL 생성
module "mssql" {
    source = "./modules/mssql"

    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location

    var-mssql-subnet-id = "${module.network.output-mssql-subnet-id}"
} 

// SQL Managed Instance 생성
module "sqlmi" {
    source = "./modules/sqlmi"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
    var-sqlmi-subnet-id = "${module.network.output-sqlmi-subnet-id}"
}

// mySQL 생성
module "mysql" {
    source = "./modules/mysql"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
    var-mysql-subnet-id = "${module.network.output-mysql-subnet-id}"
}

// PostgreSQL 생성
module "postgresql" {
    source = "./modules/postgresql"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
    var-postgresql-subnet-id = "${module.network.output-postgresql-subnet-id}"
}

// CosmosDB 생성
module "cosmosdb" {
    source = "./modules/cosmosdb"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
}

// Redis Cache 생성
module "rediscache" {
    source = "./modules/rediscache"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
    var-redis-subnet-id = "${module.network.output-redis-subnet-id}"
}

//################################################################
// Policy
//################################################################
// Policy 생성
module "policy" {
    source = "./modules/policy"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
}

//################################################################
// Storage
//################################################################
// Storage Account 생성
module "storage" {
    source = "./modules/storage"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
}

// Managed Disk 생성
module "disk" {
    source = "./modules/disk"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
}

//################################################################
// Data
//################################################################
// Fabric Data 생성
module "data" {
    source = "./modules/fabric"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
}

//################################################################
// Security
//################################################################
// firewall
module "firewall" {
    source = "./modules/firewall"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
    var-fw-subnet-id = "${module.network.output-fw-subnet-id}"
    var-fw-public-ip = "${module.network.output-public-pip[3]}"
}

// NSG
module "nsg" {
    source = "./modules/nsg"
    var-resource-group-name = var.resource-group-name
    var-resource-group-location = var.resource-group-location
    var-nsg-subnet-id = "${module.network.output-nsg-subnet-id}"
} 