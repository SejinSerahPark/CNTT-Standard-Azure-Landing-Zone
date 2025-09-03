
// sql mi 생성
resource "azurerm_mssql_managed_instance" "example" {
    name                         = "example-mssql-mi"
    location                     = azurerm_resource_group.example.location
    resource_group_name          = azurerm_resource_group.example.name
    administrator_login          = "sqladminuser"
    administrator_login_password = "OOOOOOO"
    sku_name                     = "GP_Gen5_2"
    storage_size_in_gb           = 32
    vcores                       = 2
    subnet_id                    = azurerm_subnet.example.id
    license_type                 = "LicenseIncluded"
    public_data_endpoint_enabled = false
    timezone                     = "UTC"
    tags                         = {
        environment = "Production"
    }
} 