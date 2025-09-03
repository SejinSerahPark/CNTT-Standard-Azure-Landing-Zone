// Storage Account 생성
resource "azurerm_storage_account" "storage" {
  name                     = "stor${random_string.suffix.result}"
  resource_group_name      = var.var-resource-group-name
  location                 = var.var-resource-group-location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  enable_https_traffic_only = true

  tags = {
    environment = "dev"
    managed_by  = "terraform"
  }
}
 