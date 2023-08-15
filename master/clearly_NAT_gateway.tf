# Create a public IP resource for the NAT gateway
resource "azurerm_public_ip" "natgw_public_ip" {
  allocation_method = "Static"
  idle_timeout_in_minutes = 4
  ip_version          = "IPv4"
  location            = azurerm_resource_group.clearly-earth-rg.location
  name                = "${local.productprefix}-publicip-${local.environment}"
  resource_group_name = azurerm_resource_group.clearly-earth-rg.name
  sku                 = "Standard"
  # Add tags for easy resource identification
  tags                = {
    Environment = local.environment
    Product = local.productprefix
  }
  # Define an empty list for zones and timeouts for future use
  zones               = []
  
  timeouts {}
 
}

# Create a NAT gateway resource
resource "azurerm_nat_gateway" "nat_gateway" {
  location                = azurerm_resource_group.clearly-earth-rg.location
  name                    = "${local.productprefix}-nat-${local.environment}"
  resource_group_name  = azurerm_resource_group.clearly-earth-rg.name
  sku_name = "Standard"
  tags                = {
    Environment = local.environment
    Product = local.productprefix
  }
  zones    = []
  
  timeouts {}
} 