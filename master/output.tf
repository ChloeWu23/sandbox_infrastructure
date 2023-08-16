/*
output "client_certificate" {
  value     = azurerm_kubernetes_cluster.clearly_aks.kube_config[0].client_certificate
  sensitive = true
}

output "client_key" {
  value     = azurerm_kubernetes_cluster.clearly_aks.kube_config[0].client_key
  sensitive = true
}

output "cluster_ca_certificate" {
  value     = azurerm_kubernetes_cluster.clearly_aks.kube_config[0].cluster_ca_certificate
  sensitive = true
}
*/

output "cluster_password" {
  value     = azurerm_kubernetes_cluster.clearly_aks.kube_config[0].password
  sensitive = true
}

output "cluster_username" {
  value     = azurerm_kubernetes_cluster.clearly_aks.kube_config[0].username
  sensitive = true
}

output "host" {
  value     = azurerm_kubernetes_cluster.clearly_aks.kube_config[0].host
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.clearly_aks.kube_config_raw
  sensitive = true
}

output "resource_group_name" {
  value = azurerm_resource_group.clearly-earth-rg.name
}

# Additional outputs from AKS 
output "cluster_id" {
  value = azurerm_kubernetes_cluster.clearly_aks.id
}
output "cluster_name" {
  value = azurerm_kubernetes_cluster.clearly_aks.name
}
output "cluster_kubernetes_version" {
  value = azurerm_kubernetes_cluster.clearly_aks.kubernetes_version
}

# PBV Output ACR info
# https://github.com/avinor/terraform-azurerm-container-registry/blob/master/outputs.tf
# output "azurerm_container_registry_id" {
#   description = "The Container Registry ID"
#   value       = azurerm_container_registry.clearly_acr.id
# }
# output "azurerm_container_registry_login_server" {
#   description = "The URL that can be used to log into the container registry."
#   value       = azurerm_container_registry.clearly_acr.login_server
# }
