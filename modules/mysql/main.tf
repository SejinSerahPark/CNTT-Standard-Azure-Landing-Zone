// my-sql 생성

resource "azurerm_mysql_server" "mysql" {
  name                = "mysql-server-${var.var-resource-group-name}"
  location            = var.var-resource-group-location
  resource_group_name = var.var-resource-group-name

  administrator_login          = "mysqladmin"
  administrator_login_password = "P@ssw0rd1234!"

  sku_name   = "B_Gen5_1"
  storage_mb = 5120
  version    = "5.7"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true
}

resource "azurerm_mysql_virtual_network_rule" "mysql_vnet_rule" {
  name                = "mysql-vnet-rule"
  server_name         = azurerm_mysql_server.mysql.name
  resource_group_name = var.var-resource-group-name
  subnet_id           = var.var-mysql-subnet-id
}