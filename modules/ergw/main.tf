# ER Gateway 생성 

resource "azurerm_virtual_network_gateway" "ergw" {
  name                = "ergw-gateway"
  location            = var.var-resource-group-location
  resource_group_name = var.var-resource-group-name

  type     = "ExpressRoute"
  sku      = "Standard"
  enable_bgp = false

  ip_configuration {
    name                          = "ergw-ipconfig"
    subnet_id                     = var.var-ergw-subnet-id
    public_ip_address_id          = var.var-ergw-public-ip
    private_ip_address_allocation = "Dynamic"
  }
}