# Create a virtual network with the specified address space and name, and add tags to it
resource "azurerm_virtual_network" "virtual_network" {
  address_space = local.vnetaddressrange
  dns_servers   = []
  location            = azurerm_resource_group.sandbox-cadt-rg.location
  name                = "${local.productprefix}-vnet-${local.environment}"
  resource_group_name = azurerm_resource_group.sandbox-cadt-rg.name

  timeouts {}
  # Add tags to the virtual network
  tags                = {
    Environment = local.environment
    Product = local.productprefix
  }
}

resource "azurerm_subnet" "subnet1" {
  name                 = "${local.productprefix}-subnet1-${local.environment}"
  #enforce_private_link_endpoint_network_policies = false
  private_endpoint_network_policies_enabled = true
  enforce_private_link_service_network_policies  = false
  resource_group_name  = azurerm_resource_group.sandbox-cadt-rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  service_endpoints    = []

  # Specify the address prefixes for the subnet
  address_prefixes     = local.k8ssubnet

}

# Create another subnet with the specified name and address prefixes, and attach it to the virtual network
resource "azurerm_subnet" "appgwsubnet" {
  name                 = "${local.productprefix}-appgwsubnet-${local.environment}"
  enforce_private_link_endpoint_network_policies = false
  enforce_private_link_service_network_policies  = false
  resource_group_name  = azurerm_resource_group.sandbox-cadt-rg.name
  virtual_network_name = azurerm_virtual_network.virtual_network.name
  service_endpoints    = []

  address_prefixes     = local.appgwsubnet

}

