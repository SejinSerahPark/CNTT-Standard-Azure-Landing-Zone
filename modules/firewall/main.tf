# Azure Firewall 생성
resource "azurerm_firewall" "fw" {
  name                = "fw-${var.var-resource-group-name}"
  location            = var.var-resource-group-location
  resource_group_name = var.var-resource-group-name

  sku_name = "AZFW_VNet"
  sku_tier = "Standard"

  ip_configuration {
    name                 = "fw-ipconfig"
    subnet_id            = var.var-fw-subnet-id
    public_ip_address_id = var.var-fw-public-ip
  }
} 