# Create user assigned identity for the application gateway and KeyVault
# User Assigned Identities 
resource "azurerm_user_assigned_identity" "userIdentity" {
  resource_group_name = azurerm_resource_group.sandbox-cadt-rg.name
  location            = azurerm_resource_group.sandbox-cadt-rg.location

  name = "${local.productprefix}-mi-${local.environment}"

  tags                = {
    Environment = local.environment
    Product = local.productprefix
  }
}



# Create public IP address for the application gateway
resource "azurerm_public_ip" "public_ip" {
  name                = "${local.productprefix}_publicIp_${local.envprefix}"
  location            = azurerm_resource_group.sandbox-cadt-rg.location
  resource_group_name = azurerm_resource_group.sandbox-cadt-rg.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags                = {
    Environment = local.environment
    Product = local.productprefix
  }
}

# Create application gateway with backend pool, HTTP settings, listener, and routing rule
resource "azurerm_application_gateway" "sandbox_appgw" {
  name                = "${local.productprefix}_appgw_${local.envprefix}"
  resource_group_name = azurerm_resource_group.sandbox-cadt-rg.name
  location            = azurerm_resource_group.sandbox-cadt-rg.location

  sku {
    name     = "Standard_v2"
    tier     = "Standard_v2"
    capacity = 2
  }

  gateway_ip_configuration {
    name      = "${local.productprefix}_appGatewayIpConfig_${local.envprefix}"
    subnet_id = azurerm_subnet.appgwsubnet.id
  }

  frontend_port {
    name = "httpPort"
    port = 80
  }

  frontend_port {
    name = "httpsPort"
    port = 443
  }

  frontend_ip_configuration {
    name                 = "${local.productprefix}_frontendIP_${local.envprefix}"
    public_ip_address_id = azurerm_public_ip.public_ip.id
  }

  backend_address_pool {
    name = "${local.productprefix}_backendaddpool_${local.envprefix}"
  }

  backend_http_settings {
    name                  = "${local.productprefix}_bse_${local.envprefix}"
    cookie_based_affinity = "Disabled"
    port                  = 80
    protocol              = "Http"
    request_timeout       = 1
  }

  http_listener {
    name                           = "${local.productprefix}_listener_${local.envprefix}"
    frontend_ip_configuration_name = "${local.productprefix}_frontendIP_${local.envprefix}"
    frontend_port_name             = "httpPort"
    protocol                       = "Http"
  }

  request_routing_rule {
    name                       = "${local.productprefix}_rules_${local.envprefix}"
    rule_type                  = "Basic"
    http_listener_name         = "${local.productprefix}_listener_${local.envprefix}"
    backend_address_pool_name  = "${local.productprefix}_backendaddpool_${local.envprefix}"
    backend_http_settings_name = "${local.productprefix}_bse_${local.envprefix}"
    priority = 10
  }

 tags                = {
    Environment = local.environment
    Product = local.productprefix
  }

  depends_on = [azurerm_virtual_network.virtual_network, azurerm_public_ip.public_ip]
}


# Assign "Network Contributor" role to the AKS service principal for the subnet
resource "azurerm_role_assignment" "ra1" {
  scope                = azurerm_subnet.subnet1.id
  role_definition_name = "Network Contributor"
  principal_id         = var.aks_service_principal_object_id

  depends_on = [azurerm_virtual_network.virtual_network]
}

# Assign "Managed Identity Operator" role to the AKS service principal for the user assigned identity
resource "azurerm_role_assignment" "ra2" {
  scope                = azurerm_user_assigned_identity.userIdentity.id
  role_definition_name = "Managed Identity Operator"
  principal_id         = var.aks_service_principal_object_id
  depends_on           = [azurerm_user_assigned_identity.userIdentity]
}

# Assign "Contributor" role to the user assigned identity for the application gateway
resource "azurerm_role_assignment" "ra3" {
  scope                = azurerm_application_gateway.sandbox_appgw.id
  role_definition_name = "Contributor"
  principal_id         = azurerm_user_assigned_identity.userIdentity.principal_id
  depends_on           = [azurerm_user_assigned_identity.userIdentity, azurerm_application_gateway.sandbox_appgw]
}

# Assign "Reader" role to the user assigned identity for the resource group
resource "azurerm_role_assignment" "ra4" {
  scope                = azurerm_resource_group.sandbox-cadt-rg.id
  role_definition_name = "Reader"
  principal_id         = azurerm_user_assigned_identity.userIdentity.principal_id
  depends_on           = [azurerm_user_assigned_identity.userIdentity, azurerm_application_gateway.sandbox_appgw]
}

