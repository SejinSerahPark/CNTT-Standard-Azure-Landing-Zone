az logout

#로그인, 계정
az login --tenant "628a73e0-e29b-43fd-86b5-9c2fc6d86185"
az account set --subscription "c679d50d-c9db-4274-b2eb-4aa0761226c4"

#리소스 그룹
az group create --location koreacentral --name rg-prd-prd --tags CreateDate=2023.10.12
az group create --location koreacentral --name rg-prd-dmz --tags CreateDate=2023.10.12
az group create --location koreacentral --name rg-prd-biz --tags CreateDate=2023.10.12
az group create --location koreacentral --name rg-prd-sperp --tags CreateDate=2023.10.12
az group create --location koreacentral --name rg-prd-tycerp --tags CreateDate=2023.10.12
az group create --location koreacentral --name rg-dev --tags CreateDate=2023.10.12
az group create --location koreacentral --name rg-plt --tags CreateDate=2023.10.12

#가상네트워크
az network vnet create -g rg-prd-hub -n vnet-hub --address-prefix 10.50.0.0/23 --subnet-name subnet-hub-waf --subnet-prefixes 10.50.0.0/26 --tags CreateDate=2023.10.12
az network vnet create -g rg-prd-dmz -n vnet-dmz --address-prefix 10.50.10.0/24 --subnet-name subnet-dmz-ext --subnet-prefixes 10.50.10.0/25 --tags CreateDate=2023.10.12
az network vnet create -g rg-prd-biz -n vnet-biz --address-prefix 10.50.11.0/24 --subnet-name subnet-biz-app --subnet-prefixes 10.50.11.0/26 --tags CreateDate=2023.10.12
az network vnet create -g rg-prd-sperp -n vnet-sperp --address-prefix 10.50.12.0/24 --subnet-name subnet-sperp-app --subnet-prefixes 10.50.12.0/26 --tags CreateDate=2023.10.12
az network vnet create -g rg-prd-tycerp -n vnet-tycerp --address-prefix 10.50.13.0/24 --subnet-name subnet-tycerp-app --subnet-prefixes 10.50.13.0/26 --tags CreateDate=2023.10.12
az network vnet create -g rg-dev -n vnet-dev --address-prefix 10.50.20.0/24 --subnet-name subnet-dev-app --subnet-prefixes 10.50.20.0/26 --tags CreateDate=2023.10.12
az network vnet create -g rg-plt -n vnet-plt --address-prefix 10.50.30.0/24 --subnet-name subnet-plt-app --subnet-prefixes 10.50.30.0/26 --tags CreateDate=2023.10.12

#기타 서브넷
az network vnet subnet create -g rg-prd-hub --vnet-name vnet-hub -n subnet-hub-fortilog --address-prefixes 10.50.0.64/27
az network vnet subnet create -g rg-prd-hub --vnet-name vnet-hub -n subnet-hub-jump --address-prefixes 10.50.0.96/27
az network vnet subnet create -g rg-prd-hub --vnet-name vnet-hub -n subnet-hub-fortiext --address-prefixes 10.50.1.0/26
az network vnet subnet create -g rg-prd-hub --vnet-name vnet-hub -n subnet-hub-fortiint --address-prefixes 10.50.1.64/26
az network vnet subnet create -g rg-prd-hub --vnet-name vnet-hub -n subnet-hub-fortimgmt --address-prefixes 10.50.1.128/26
az network vnet subnet create -g rg-prd-hub --vnet-name vnet-hub -n subnet-hub-fortihasync --address-prefixes 10.50.1.192/26
az network vnet subnet create -g rg-prd-biz --vnet-name vnet-biz -n subnet-biz-db --address-prefixes 10.50.11.64/26
az network vnet subnet create -g rg-prd-biz --vnet-name vnet-biz -n subnet-biz-sec --address-prefixes 10.50.11.128/26
az network vnet subnet create -g rg-prd-sperp --vnet-name vnet-sperp -n subnet-sperp-db --address-prefixes 10.50.12.64/26
az network vnet subnet create -g rg-prd-tycerp --vnet-name vnet-tycerp -n subnet-tycerp-db --address-prefixes 10.50.13.64/26
az network vnet subnet create -g rg-dev --vnet-name vnet-dev -n subnet-dev-db --address-prefixes 10.50.20.64/26
az network vnet subnet create -g rg-plt --vnet-name vnet-plt -n subnet-plt-db --address-prefixes 10.50.30.64/26

# 네트워크 보안 그룹
az network nsg create -g rg-prd-hub -n nsg-hub-waf --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-hub -n nsg-hub-fortilog --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-hub -n nsg-hub-jump --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-hub -n nsg-hub-fortiext --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-hub -n nsg-hub-fortiint --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-hub -n nsg-hub-fortimgmt --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-hub -n nsg-hub-fortihasync --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-dmz -n nsg-dmz-ext --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-biz -n nsg-biz-app --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-biz -n nsg-biz-db --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-biz -n nsg-biz-sec --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-sperp -n nsg-sperp-app --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-sperp -n nsg-sperp-db --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-tycerp -n nsg-tycerp-app --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-prd-tycerp -n nsg-tycerp-db --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-dev -n nsg-dev-app --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-dev -n nsg-dev-db --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-plt -n nsg-plt-app --tags --tags CreateDate=2023.10.12
az network nsg create -g rg-plt -n nsg-plt-db --tags --tags CreateDate=2023.10.12
