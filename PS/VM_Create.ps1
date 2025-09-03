az logout
#삼표
az login --tenant "628a73e0-e29b-43fd-86b5-9c2fc6d86185"
az account set --subscription "c679d50d-c9db-4274-b2eb-4aa0761226c4"

#점프서버 1
$RGName = "rg-prd-hub"
$Location = "koreacentral"
$VMName = "vm-hub-jump01"
$vnetname = "vnet-hub"
$subnetname = "subnet-hub-jump"
$privateip = "10.50.0.101"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
$computername = "hub-jump01"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

#점프서버 2
$RGName = "rg-prd-hub"
$Location = "koreacentral"
$VMName = "vm-hub-jump02"
$vnetname = "vnet-hub"
$subnetname = "subnet-hub-jump"
$privateip = "10.50.0.102"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
$computername = "hub-jump02"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

#점프서버 3
$RGName = "rg-prd-hub"
$Location = "koreacentral"
$VMName = "vm-hub-jump03"
$vnetname = "vnet-hub"
$subnetname = "subnet-hub-jump"
$privateip = "10.50.0.103"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
$computername = "hub-jump03"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

#점프서버 4 - 비젠트로용
$RGName = "rg-prd-hub"
$Location = "koreacentral"
$VMName = "vm-hub-jump04"
$vnetname = "vnet-hub"
$subnetname = "subnet-hub-jump"
$privateip = "10.50.0.104"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
$computername = "hub-jump04"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

#ERP TEST 203
$RGName = "rg-dev"
$Location = "koreacentral"
$VMName = "vm-derp-test1"
$computername = "derp-test1"
$vnetname = "vnet-dev"
$subnetname = "subnet-dev-app"
$privateip = "10.50.20.21"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_E8ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

#Uni ERP HR 신규 서버
$RGName = "rg-dev"
$Location = "koreacentral"
$VMName = "vm-dhr-app1"
$computername = "dhr-app1"
$vnetname = "vnet-dev"
$subnetname = "subnet-dev-app"
$privateip = "10.50.20.31"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# MES 운영 WEB1
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-mes-web1"
$computername = "mes-web1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.11"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_F8s_v2"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""
az network nic create --name $NICName --resource-group $RGName --subnet $subnetname --vnet-name $vnetname --private-ip-address $privateip --accelerated-networking true 
az vm create --name $VMName --resource-group $RGName --attach-os-disk /subscriptions/c679d50d-c9db-4274-b2eb-4aa0761226c4/resourcegroups/rg-prd-dmz/providers/Microsoft.Compute/disks/osdisk-vm-mes-web1 --size $VMSize --nics $NICName --os-type windows

# MES 운영 spc db1
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-mes-spcdb1"
$computername = "mes-spcdb1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-db"
$privateip = "10.50.11.71"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d8ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# MES 운영 통합서버 db1
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-mes-samdb1"
$computername = "mes-samdb1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-db"
$privateip = "10.50.11.72"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_E8ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# MES 운영 qc db1
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-mes-qcdb1"
$computername = "mes-qcdb1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-db"
$privateip = "10.50.11.73"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d8ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

#ERP TEST 204
$RGName = "rg-dev"
$Location = "koreacentral"
$VMName = "vm-derp-test2"
$computername = "derp-test2"
$vnetname = "vnet-dev"
$subnetname = "subnet-dev-db"
$privateip = "10.50.20.72"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_E8ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

#web vm1 (각종웹)
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-dmz-spweb1"
$computername = "dmz-spweb1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.5"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "erockyenterprisesoftwarefoundationinc1653071250513:rockylinux-9:rockylinux-9:9.1.20230215" # 로키 9.1
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

#중앙로그서버
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-cenlog1"
$computername = "biz-cenlog1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-sec"
$privateip = "10.50.11.151"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "512"
$imagename = "erockyenterprisesoftwarefoundationinc1653071250513:rockylinux-9:rockylinux-9:9.1.20230215"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# WEB 연계서버 90
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-dmz-iisweb1"
$computername = "dmz-iisweb1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.9"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_f4s_v2"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# nethelper 7.8 파일럿
$RGName = "rg-plt"
$Location = "koreacentral"
$VMName = "vm-plt-nhv7"
$computername = "plt-nhv7"
$vnetname = "vnet-plt"
$subnetname = "subnet-plt-app"
$privateip = "10.50.30.7"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_e4ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# nethelper 80 운영
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-nhv8"
$computername = "biz-nhv8"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-sec"
$privateip = "10.50.11.142"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_e4ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "erockyenterprisesoftwarefoundationinc1653071250513:rockylinux-9:rockylinux-9:9.1.20230215"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# 점프박스5
$RGName = "rg-prd-hub"
$Location = "koreacentral"
$VMName = "vm-hub-jump05"
$computername = "hub-jump05"
$vnetname = "vnet-hub"
$subnetname = "subnet-hub-jump"
$privateip = "10.50.0.105"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# 삼표시맨트web (123.23 서버 대응 이었는데 대시보드용으로 바뀜)
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-spweb2"
$computername = "biz-spweb2"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.7"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "64"
$imagename = "erockyenterprisesoftwarefoundationinc1653071250513:rockylinux-9:rockylinux-9:9.1.20230215"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# DNS # 테스트 후 제거
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-dns"
$computername = "biz-dns"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-sec"
$privateip = "10.50.11.161"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# solo / smart app
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-dmz-smweb1"
$computername = "dmz-smweb1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.13"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_f4s_v2"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# solo / smart DB
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-smdb1"
$computername = "biz-smdb1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-db"
$privateip = "10.50.11.81"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d4ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# 선박관리 WEB
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-dmz-fleetweb1"
$computername = "dmz-fleetweb1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.15"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# 선박관리 DB
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-fleetdb1"
$computername = "biz-fleetdb1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-db"
$privateip = "10.50.11.85"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_e4ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# 트러스빌, MMS 문자 서비스
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-dmz-mms1"
$computername = "dmz-mms1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.25"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# nethelper 78 운영
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-nhv7"
$computername = "biz-nhv7"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-sec"
$privateip = "10.50.11.141"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_e4ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# 진짜진짜 삼표시맨트web (123.23 서버 대응)
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-dmz-tycweb1"
$computername = "dmz-tycweb1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.7"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_F2s_v2"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "64"
$imagename = "erockyenterprisesoftwarefoundationinc1653071250513:rockylinux-9:rockylinux-9:9.1.20230215"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# 점프박스6
$RGName = "rg-prd-hub"
$Location = "koreacentral"
$VMName = "vm-hub-jump06"
$computername = "hub-jump06"
$vnetname = "vnet-hub"
$subnetname = "subnet-hub-jump"
$privateip = "10.50.0.106"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# 신규 HR 운영 app 서버
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-ehr-app1"
$computername = "ehr-app1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.30"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D8ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "512"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# eset 서버
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-eset1"
$computername = "biz-eset1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-sec"
$privateip = "10.50.11.135"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D4ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# pnc cad auth
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-pnccad1"
$computername = "biz-pnccad1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.36"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_f2s_v2"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# railway cad auth
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-railcad1"
$computername = "biz-railcad1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.37"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_f2s_v2"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# sampyo cad auth
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-spcad1"
$computername = "biz-spcad1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.38"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_f2s_v2"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# 신한 cms 1 ######삭제함
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-spshcms1"
$computername = "biz-spshcms1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.32"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_e2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# DNS1
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-dns1"
$computername = "biz-dns1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.61"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

az network nic create `
--name $NICName `
--resource-group $RGName `
--subnet $subnetname `
--vnet-name $vnetname `
--private-ip-address $privateip `
--accelerated-networking true

az vm create `
--name $VMName `
--resource-group $RGName `
--image $imagename `
--os-disk-name $OSDiskName `
--storage-sku $OS_StorageType `
--os-disk-size-gb $OSDisk_Size `
--size $VMSize `
--nics $NICName `
--admin-username $adminuser `
--admin-password $adminpass `
--computer-name $computername `
--zone 1

# DNS2
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-dns2"
$computername = "biz-dns2"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.62"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

az network nic create `
--name $NICName `
--resource-group $RGName `
--subnet $subnetname `
--vnet-name $vnetname `
--private-ip-address $privateip `
--accelerated-networking true

az vm create `
--name $VMName `
--resource-group $RGName `
--image $imagename `
--os-disk-name $OSDiskName `
--storage-sku $OS_StorageType `
--os-disk-size-gb $OSDisk_Size `
--size $VMSize `
--nics $NICName `
--admin-username $adminuser `
--admin-password $adminpass `
--computer-name $computername `
--zone 2

# nethelper 80 운영 앱 서버
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-dmz-nhv8app"
$computername = "dmz-nhv8app"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.51"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d4ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "erockyenterprisesoftwarefoundationinc1653071250513:rockylinux-9:rockylinux-9:9.1.20230215"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# 삼표시맨트web 개발
$RGName = "rg-dev"
$Location = "koreacentral"
$VMName = "vm-ddmz-tycweb1"
$computername = "ddmz-tycweb1"
$vnetname = "vnet-dev"
$subnetname = "subnet-dev-app"
$privateip = "10.50.20.36"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_F2s_v2"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "64"
$imagename = "erockyenterprisesoftwarefoundationinc1653071250513:rockylinux-9:rockylinux-9:9.1.20230215"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

az network nic create --name $NICName --resource-group $RGName --subnet $subnetname --vnet-name $vnetname --private-ip-address $privateip #--accelerated-networking true 
az vm create --name $VMName --resource-group $RGName --attach-os-disk /subscriptions/c679d50d-c9db-4274-b2eb-4aa0761226c4/resourcegroups/rg-dev/providers/Microsoft.Compute/disks/osdisk-vm-ddmz-tycweb1 --size $VMSize --nics $NICName --os-type linux --plan-name rockylinux-9 --plan-product rockylinux-9 --plan-publisher erockyenterprisesoftwarefoundationinc1653071250513

# nexacro 테스트 파일럿
$RGName = "rg-plt"
$Location = "koreacentral"
$VMName = "vm-tmes-nexacro1"
$computername = "tmes-nexacro1"
$vnetname = "vnet-plt"
$subnetname = "subnet-plt-app"
$privateip = "10.50.30.21"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_e2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# sperp 웹 서버1
$RGName = "rg-prd-sperp"
$Location = "koreacentral"
$VMName = "vm-sperp-web1"
$computername = "sperp-web1"
$vnetname = "vnet-sperp"
$subnetname = "subnet-sperp-app"
$privateip = "10.50.12.11"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "MicrosoftWindowsServer:WindowsServer:2012-Datacenter:9200.24523.231004"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# sperp DB1
$RGName = "rg-prd-sperp"
$Location = "koreacentral"
$VMName = "vm-sperp-db1"
$computername = "sperp-db1"
$vnetname = "vnet-sperp"
$subnetname = "subnet-sperp-db"
$privateip = "10.50.12.69"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_E20ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "MicrosoftWindowsServer:WindowsServer:2012-Datacenter:9200.24523.231004"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# tycerp 웹 서버1
$RGName = "rg-prd-tycerp"
$Location = "koreacentral"
$VMName = "vm-tycerp-web1"
$computername = "tycerp-web1"
$vnetname = "vnet-tycerp"
$subnetname = "subnet-tycerp-app"
$privateip = "10.50.13.21"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "MicrosoftWindowsServer:WindowsServer:2012-Datacenter:9200.24523.231004"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# tycerp DB1
$RGName = "rg-prd-tycerp"
$Location = "koreacentral"
$VMName = "vm-tycerp-db1"
$computername = "tycerp-db1"
$vnetname = "vnet-tycerp"
$subnetname = "subnet-tycerp-db"
$privateip = "10.50.13.99"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_E16ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "MicrosoftWindowsServer:WindowsServer:2012-Datacenter:9200.24523.231004"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# 우리 cms 1
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-tycwcms1"
$computername = "biz-tycwcms1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.30"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# 신한 cms 1
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-spshcms1"
$computername = "biz-spshcms1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.31"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# 신한 어음서버
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-spshcms2"
$computername = "biz-spshcms2"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.32"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_e2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# 래미콘 cms 1
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-rmcwcms1"
$computername = "biz-rmcwcms1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.33"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# 자원개발 cms 1
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-damulcms1"
$computername = "biz-damulcms1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.34"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# 해운 cms 1
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-shipcms1"
$computername = "biz-shipcms1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.35"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# TYC-TEST
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-relaydb1"
$computername = "biz-relaydb1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-db"
$privateip = "10.50.11.100"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_e8ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

#Uni ERP HR 신규 DB 서버
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-ehr-db1"
$computername = "ehr-db1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-db"
$privateip = "10.50.11.90"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_e8ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# QC용 DB
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-24qcdb2"
$computername = "biz-24qcdb2"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-db"
$privateip = "10.50.11.112"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# paas 였던거 mig # webdb1
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-webdb1"
$computername = "biz-webdb1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-db"
$privateip = "10.50.11.83"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "64"
$imagename = "erockyenterprisesoftwarefoundationinc1653071250513:rockylinux-9:rockylinux-9:9.1.20230215"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# OSS DB remix plt
$RGName = "rg-plt"
$Location = "koreacentral"
$VMName = "vm-plt-remixdb1"
$computername = "plt-remixdb1"
$vnetname = "vnet-plt"
$subnetname = "subnet-plt-db"
$privateip = "10.50.30.95"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# OSS DB remix
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-dmz-remixdb1"
$computername = "dmz-remixdb1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.19"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D2ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# GPS DB
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-gpsdb1"
$computername = "biz-gpsdb1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-db"
$privateip = "10.50.11.75"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_E8ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# GPS DB
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-gpsdb1"
$computername = "biz-gpsdb1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-db"
$privateip = "10.50.11.75"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_E8ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# GPS MAP
$RGName = "rg-prd-biz"
$Location = "koreacentral"
$VMName = "vm-biz-gpsmap1"
$computername = "biz-gpsmap1"
$vnetname = "vnet-biz"
$subnetname = "subnet-biz-app"
$privateip = "10.50.11.15"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D4ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""
vm-dmz-gpsweb1

# GPS WEB
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-dmz-gpsweb1"
$computername = "dmz-gpsweb1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.21"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D4ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# GPS APP
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-dmz-gpsapp1"
$computername = "dmz-gpsapp1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.23"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_F8s_v2"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "512"
$imagename = "OpenLogic:CentOS:7_9:7.9.2023030700"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# KEMP WEB
$RGName = "rg-prd-dmz"
$Location = "koreacentral"
$VMName = "vm-dmz-kempapp1"
$computername = "dmz-kempapp1"
$vnetname = "vnet-dmz"
$subnetname = "subnet-dmz-ext"
$privateip = "10.50.10.27"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_d4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "erockyenterprisesoftwarefoundationinc1653071250513:rockylinux-9:rockylinux-9:9.1.20230215"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "128 128 4096"
# $SADiagName = ""
# $AVSetName = ""

# kemp mig 재생성
$RGName = "rg-dev"
$Location = "koreacentral"
$VMName = "vm-ddmz-tycweb1"
$computername = "ddmz-tycweb1"
$vnetname = "vnet-dev"
$subnetname = "subnet-dev-app"
$privateip = "10.50.20.29"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_F2s_v2"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "64"
$imagename = "erockyenterprisesoftwarefoundationinc1653071250513:rockylinux-9:rockylinux-9:9.1.20230215"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

az network nic create --name $NICName --resource-group $RGName --subnet $subnetname --vnet-name $vnetname --private-ip-address $privateip #--accelerated-networking true 
az vm create --name $VMName --resource-group $RGName --attach-os-disk /subscriptions/c679d50d-c9db-4274-b2eb-4aa0761226c4/resourcegroups/rg-dev/providers/Microsoft.Compute/disks/osdisk-vm-ddmz-tycweb1 --size $VMSize --nics $NICName --os-type linux --plan-name rockylinux-9 --plan-product rockylinux-9 --plan-publisher erockyenterprisesoftwarefoundationinc1653071250513

# sp erp web1 
$RGName = "rg-prd-sperp"
$Location = "koreacentral"
$VMName = "vm-sperp-web12"
$computername = "sperp-web12"
$vnetname = "vnet-sperp"
$subnetname = "subnet-sperp-app"
$privateip = "10.50.12.12"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# sp erp web2
$RGName = "rg-prd-sperp"
$Location = "koreacentral"
$VMName = "vm-sperp-web13"
$computername = "sperp-web13"
$vnetname = "vnet-sperp"
$subnetname = "subnet-sperp-app"
$privateip = "10.50.12.13"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# sp erp web3
$RGName = "rg-prd-sperp"
$Location = "koreacentral"
$VMName = "vm-sperp-web14"
$computername = "sperp-web14"
$vnetname = "vnet-sperp"
$subnetname = "subnet-sperp-app"
$privateip = "10.50.12.14"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# tyc erp web1
$RGName = "rg-prd-tycerp"
$Location = "koreacentral"
$VMName = "vm-tycerp-web22"
$computername = "tycerp-web22"
$vnetname = "vnet-tycerp"
$subnetname = "subnet-tycerp-app"
$privateip = "10.50.13.22"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# tyc erp web2
$RGName = "rg-prd-tycerp"
$Location = "koreacentral"
$VMName = "vm-tycerp-web23"
$computername = "tycerp-web23"
$vnetname = "vnet-tycerp"
$subnetname = "subnet-tycerp-app"
$privateip = "10.50.13.23"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_D4s_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# sp erp db
$RGName = "rg-prd-sperp"
$Location = "koreacentral"
$VMName = "vm-sperp-db2"
$computername = "sperp-db2"
$vnetname = "vnet-sperp"
$subnetname = "subnet-sperp-db"
$privateip = "10.50.12.88"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_E20ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# tyc erp db
$RGName = "rg-prd-tycerp"
$Location = "koreacentral"
$VMName = "vm-tycerp-db2"
$computername = "tycerp-db2"
$vnetname = "vnet-tycerp"
$subnetname = "subnet-tycerp-db"
$privateip = "10.50.13.99"
$OSDiskName = "osdisk"+"-"+$VMName
$NICName = "nic"+"-"+$VMName
$VMSize = "Standard_E16ds_v5"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "256"
$imagename = "Win2022Datacenter"
$adminuser = "sampyoadmin"
$adminpass = "azs@mpyo!@34"
# $datadisksizes = "10 20"
# $SADiagName = ""
# $AVSetName = ""

# Create AVSet
#az vm availability-set create --resource-group $RGName --name $AVSetName --platform-fault-domain 2 --platform-update-domain 5

# 포티게이트 VM (포탈생성)
# azfortigate : QWERasdf123!!

# 삼표 기본
# sampyoadmin : azs@mpyo!@34
# 파일럿
# sampyoadmin : tsp!@#$pilot1
# 씨앤토트
# cntadmin : azs@mpyo!@34

# 기타 고객
# bizentro : QWERasdf123!!
# bizentro2 : QWERasdf123!!
# nethelper : QWERasdf123!!
# be6ix : QWERasdf123!!
# dream : QWERasdf123!!
# autodesk : QWERasdf123!!
# kaonlab : QWERasdf123!!

# 우리CMS
# woori/qwer!@34
 
# 신한CMS
# finger/qwer!@34

# 삼바 계정 (10.50.10.5)
# sbuser : sam@pyo@123!!

# 접근 포트 RDP
# 점프박스 9389 ++
# 기본 서버들 4389

# 시스템 로케일
# Set-WinSystemLocale en-US

## Create VM ##
az network nic create `
--name $NICName `
--resource-group $RGName `
--subnet $subnetname `
--vnet-name $vnetname `
--private-ip-address $privateip `
--accelerated-networking true

az vm create `
--name $VMName `
--resource-group $RGName `
--image $imagename `
--os-disk-name $OSDiskName `
--storage-sku $OS_StorageType `
--os-disk-size-gb $OSDisk_Size `
--size $VMSize `
--nics $NICName `
--admin-username $adminuser `
--admin-password $adminpass `
--computer-name $computername
# --security-type Standard
# --enable-auto-update false `
# --patch-mode Manual

#--boot-diagnostics-storage $SADiagName
#--availability-set $AVSetName
#--data-disk-sizes-gb 10 20

# Win2022Datacenter
# MicrosoftWindowsServer:WindowsServer:2012-Datacenter:9200.24523.231004

# az vm image list --publisher "OpenLogic" --Offer "CentOS" --all -o table
# az vm image list --offer CentOS --publisher "OpenLogic" --all -o table # OpenLogic:CentOS:7_9:7.9.2023030700
# az vm image list --offer rockylinux-9 --all -o table
# az vm image list --offer rockylinux --all -o table
# az vm image list --publisher "erockyenterprisesoftwarefoundationinc1653071250513" --all -o table
# az vm image list --offer sql2012sp4-ws2012r2 --publisher "MicrosoftWindowsServer" -o table
az vm image list --offer sql2012sp4-ws2012r2 --publisher "microsoftsqlserver" --sku standard --all -o table
# az vm image list --offer WindowsServer --publisher "MicrosoftWindowsServer" --sku 2012-Datacenter --all -o table
# "erockyenterprisesoftwarefoundationinc1653071250513:rockylinux-9:rockylinux-9:9.1.20230215"

# MicrosoftWindowsServer:WindowsServer:2008-R2-SP1:latest
# Win2008R2SP1

# Set-ItemProperty -Path HKLM:\SYSTEM\CurrentControlSet\Services\cdrom -Name Start -Value 1 -Type Dword
# az vm update
# --license-type Windows_Server


# --enable-auto-update false # ture
# --patch-mode {AutomaticByOS, AutomaticByPlatform, ImageDefault, Manual}
# --patch-mode ImageDefault
# --enable-auto-update false
# --patch-mode Manual

az vm image list -o table

