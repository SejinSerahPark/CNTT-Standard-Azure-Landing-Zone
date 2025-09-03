// Redis Cache 배포

resource "azurerm_redis_cache" "redis" {
  name                = "redis-cache-${var.var-resource-group-name}"
  location            = var.var-resource-group-location
  resource_group_name = var.var-resource-group-name
  capacity            = 2
  family              = "C"
  sku_name            = "Standard"
  subnet_id           = var.var-redis-subnet-id
  enable_non_ssl_port = false
  minimum_tls_version = "1.2"
} 