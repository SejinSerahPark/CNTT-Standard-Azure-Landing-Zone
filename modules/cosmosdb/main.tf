# CosmosDB 생성 

resource "azurerm_cosmosdb_account" "cosmosdb" {
  name                = "cosmosdb-${var.var-resource-group-name}"
  location            = var.var-resource-group-location
  resource_group_name = var.var-resource-group-name
  offer_type          = "Standard"
  kind                = "GlobalDocumentDB"

  consistency_policy {
    consistency_level       = "Session"
  }

  geo_location {
    location          = var.var-resource-group-location
    failover_priority = 0
  }

  capabilities {
    name = "EnableMultipleWriteLocations"
  }

  enable_automatic_failover = true
  is_virtual_network_filter_enabled = false
}