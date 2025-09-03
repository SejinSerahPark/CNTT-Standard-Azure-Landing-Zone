// Azure Fabric Data 배포 모듈
resource "azurerm_storage_account" "fabric_data" {
  name                     = "fabricdatastorage${random_string.suffix.result}"
  resource_group_name      = var.var-resource-group-name
  location                 = var.var-resource-group-location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  kind                     = "StorageV2"
  access_tier              = "Hot"

  tags = {
    environment = "fabric"
  }
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}