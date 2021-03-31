output "id" {
  value = azurerm_kubernetes_cluster.k8s_cluster.id
}
output "fqdn" {
  value = azurerm_kubernetes_cluster.k8s_cluster.fqdn
}
output "private_fqdn" {
  value = azurerm_kubernetes_cluster.k8s_cluster.private_fqdn
}
output "kube_admin_config" {
  value = azurerm_kubernetes_cluster.k8s_cluster.kube_admin_config
}
output "kube_admin_config_raw" {
  value = azurerm_kubernetes_cluster.k8s_cluster.kube_admin_config_raw
}
output "kube_config" {
  value = azurerm_kubernetes_cluster.k8s_cluster.kube_config
}
output "kube_config_raw" {
  value = azurerm_kubernetes_cluster.k8s_cluster.kube_config_raw
}
output "node_resource_group" {
  value = azurerm_kubernetes_cluster.k8s_cluster.node_resource_group
}
output "kubelet_identity" {
  value = azurerm_kubernetes_cluster.k8s_cluster.kubelet_identity
}