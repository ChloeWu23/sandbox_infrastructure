
resource "random_id" "log_analytics_workspace_name_suffix" {
  byte_length = 8
}

resource "azurerm_log_analytics_workspace" "loganalytics_wkspce" {
  location            = azurerm_resource_group.sandbox-cadt-rg.location
  # The WorkSpace name has to be unique across the whole of azure;
  # not just the current subscription/tenant.
  name                = "${local.productprefix}-loganalytics-${local.environment}"
  resource_group_name = azurerm_resource_group.sandbox-cadt-rg.name
  sku                 = var.log_analytics_workspace_sku
}

resource "azurerm_log_analytics_solution" "loganalytics_soln" {
  location              = azurerm_resource_group.sandbox-cadt-rg.location
  resource_group_name   = azurerm_resource_group.sandbox-cadt-rg.name
  solution_name         = "ContainerInsights"
  workspace_name        = azurerm_log_analytics_workspace.loganalytics_wkspce.name
  workspace_resource_id = azurerm_log_analytics_workspace.loganalytics_wkspce.id

  plan {
    product   = "OMSGallery/ContainerInsights"
    publisher = "Microsoft"
  }
}