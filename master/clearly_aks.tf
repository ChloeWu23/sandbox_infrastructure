# Creates an Azure Kubernetes Service cluster
resource "azurerm_kubernetes_cluster" "clearly_aks" {
  location            = azurerm_resource_group.clearly-earth-rg.location
  name                = "${local.productprefix}-aks-${local.environment}-master"
  resource_group_name = azurerm_resource_group.clearly-earth-rg.name
  dns_prefix          = "${local.productprefix}-aks-${local.environment}"
  node_resource_group = "${local.productprefix}-aks-${local.environment}-nrg"
  oidc_issuer_enabled = true
  role_based_access_control_enabled = var.aks_enable_rbac
  sku_tier            = var.sku_tier
  # kubernetes_version  = data.azurerm_kubernetes_service_versions.current.latest_version (something to consider at some point)

  # Specifies the default node pool configuration
  default_node_pool {
    name       = "agentpool"
    vm_size    = var.vm_size
    node_count = var.agent_count 
    min_count = var.agent_count_min
    max_count = var.agent_count_max
    enable_auto_scaling = true
    vnet_subnet_id = azurerm_subnet.subnet1.id
    
    # orchestrator_version = data.azurerm_kubernetes_service_versions.current.latest_version (something to consider at some point)
    # availability_zones   = [1, 2, 3]  (something to consider later)
    # os_disk_size_gb      = 30 (something to consider later)
    type                 = "VirtualMachineScaleSets"
    node_labels = {
      "nodepool-type"    = "system"
      "environment"      = "${local.environment}"
      "nodepoolos"       = "linux"
      "app"              = "system-apps" 
    } 
  }
  # Configures the Linux profile for the nodes
  linux_profile {
    admin_username = "ubuntu"
    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }
  # Configures the network profile
  network_profile {
    network_plugin    = "azure"
    
  }
  
  # Configures the service principal for the cluster
  service_principal {
    client_id     = var.aks_service_principal_app_id
    client_secret = var.aks_service_principal_client_secret
  }
 
  # Specifies dependencies for the cluster
  depends_on = [azurerm_virtual_network.virtual_network, azurerm_application_gateway.clearly_appgw]
  
  key_vault_secrets_provider {
           secret_rotation_enabled  = false 
           secret_rotation_interval = "2m"
  }
  # Specifies tags for the cluster
  # PBV Creating a VAR from Environment
  tags                = {
    Environment = local.environment
    Product = local.productprefix
  }

}