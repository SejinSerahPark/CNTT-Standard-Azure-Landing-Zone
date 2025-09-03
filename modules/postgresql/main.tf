# PostgreSQL 배포 모듈
resource "azurerm_postgresql_server" "postgresql" {
  name                = "pg-server-${random_string.postfix.result}"
  location            = var.var-resource-group-location
  resource_group_name = var.var-resource-group-name

  administrator_login          = "pgadmin"
  administrator_login_password = "000000"

  sku_name   = "B_Gen5_1"
  storage_mb = 5120
  version    = "11"

  auto_grow_enabled                 = true
  backup_retention_days             = 7
  geo_redundant_backup_enabled      = false
  public_network_access_enabled     = false
  ssl_enforcement_enabled           = true

  tags = {
    environment = "dev"
  }
}

resource "azurerm_postgresql_virtual_network_rule" "vnet_rule" {
  name      = "pg-vnet-rule"
  server_name            = azurerm_postgresql_server.postgresql.name
  resource_group_name    = var.var-resource-group-name
  subnet_id              = var.var-postgresql-subnet-id
}

resource "random_string" "postfix" {
  length  = 6
  upper   = false
  special = false
}
