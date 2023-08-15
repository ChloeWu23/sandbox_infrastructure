# Define an Azure Container Registry resource with a premium SKU, named based on environment
resource "azurerm_container_registry" "clearly_acr" {
  name                = "clearlyACR${local.environment}"
  resource_group_name = azurerm_resource_group.clearly-earth-rg.name
  location            = azurerm_resource_group.clearly-earth-rg.location
  sku                 = "Premium"
  tags                = {
    Environment = local.environment
    Product = local.productprefix
  }
  # For the prod/main environment we need replication
  #georeplications {
  #  location                = "East US"
  #  zone_redundancy_enabled = true
  #  tags                    = {}
  #}
}