az logout
#삼표
az login --tenant "628a73e0-e29b-43fd-86b5-9c2fc6d86185"
az account set --subscription "c679d50d-c9db-4274-b2eb-4aa0761226c4"

##########################################      VM config              ######################################
# VHD information for the storage account
$OSdiskURL =  "https://pltvhd.blob.core.windows.net/cnttjs/30renew.vhd"

## Create Managed OS Disk using uploaded VHD
$RGName = "rg-plt"
$Location = "koreacentral"
$OSDiskName = "osdisk-vm-plt-report1"

## VM creation resource information (newly created)
$VMName = "vm-plt-report1"
$privateIPAddress = "10.50.30.10"
$NICName = "nic-vm-plt-report1"
$VMSize = "Standard_B2ms"
$VnetName = "vnet-plt"
$SubnetName = "subnet-plt-app"
$OS_StorageType = "standard_LRS"
$OSDisk_Size = "64"
$os_type = "windows"

#---------------------------------------- Create Managed OS,Data Disk using uploaded VHD ----------------------------------------#
# Create VM #
az disk create --resource-group $RGName --name $OSDiskName --sku $OS_StorageType --location $location --size-gb $OSDisk_Size --source $OSdiskURL
az network nic create --resource-group $RGName --name $NICName --vnet-name $VnetName --subnet $SubnetName --private-ip-address $privateIPAddress
az vm create --name $VMName --resource-group $RGName --attach-os-disk $OSDiskName --os-type $os_type --size $VMSize --nics $NICName

####Check####
az disk list


###############real###################
## Create Managed OS Disk using uploaded VHD
$RGName = "rg-prd-sperp"
$Location = "koreacentral"
$OSDiskName = "osdisk-vm-sperp-report1"

## VM creation resource information (newly created)
$VMName = "vm-sperp-report1"
$privateIPAddress = "10.50.12.17"
$NICName = "nic-vm-sperp-report1"
$VMSize = "Standard_f4s_v2"
$VnetName = "vnet-sperp"
$SubnetName = "subnet-sperp-app"
$OS_StorageType = "StandardSSD_LRS"
$OSDisk_Size = "128"
$os_type = "windows"