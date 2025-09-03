# Managed Disk 생성
resource "azurerm_managed_disk" "disk" {
  name                 = "my-managed-disk"
  location             = var.var-resource-group-location
  resource_group_name  = var.var-resource-group-name
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = 128

  tags = {
    environment = "dev"
  }
}