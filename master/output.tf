
output "cluster_password" {
  value     = azurerm_kubernetes_cluster.sandbox_aks.kube_config[0].password
  sensitive = true
}

output "cluster_username" {
  value     = azurerm_kubernetes_cluster.sandbox_aks.kube_config[0].username
  sensitive = true
}

output "host" {
  value     = azurerm_kubernetes_cluster.sandbox_aks.kube_config[0].host
  sensitive = true
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.sandbox_aks.kube_config_raw
  sensitive = true
}

output "resource_group_name" {
  value = azurerm_resource_group.sandbox-cadt-rg.name
}

# Additional outputs from AKS 
output "cluster_id" {
  value = azurerm_kubernetes_cluster.sandbox_aks.id
}
output "cluster_name" {
  value = azurerm_kubernetes_cluster.sandbox_aks.name
}
output "cluster_kubernetes_version" {
  value = azurerm_kubernetes_cluster.sandbox_aks.kubernetes_version
}

