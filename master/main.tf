# Resource to create an Azure Resource Group with the name and location defined in the variables.
resource "azurerm_resource_group" "sandbox-cadt-rg" {
  location = var.region
  name     = "${local.productprefix}-${local.environment}-${var.region}-rg-master"
  tags                = {
    Environment = local.environment
    Product = local.productprefix
  }
}

# Data source to retrieve the current Azure client configuration.
data "azurerm_client_config" "current" {
}

# Output to display the Azure account ID.
output "account_id" {
  value = data.azurerm_client_config.current.client_id
}