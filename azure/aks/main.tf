resource "azurerm_resource_group" "resource_group" {
  name     = "${var.tenant}-${var.env}"
  location = var.location
}
resource "azurerm_kubernetes_cluster" "k8s_cluster" {
  name                = "${var.tenant}-${var.env}"
  location            = var.location
  resource_group_name = azurerm_resource_group.resource_group.name
  dns_prefix          = "${var.tenant}-${var.env}"
  kubernetes_version  = var.k8s_version
  default_node_pool {
    name       = "default"
    node_count = var.nodes_count
    vm_size    = var.nodes_sku
    os_disk_size_gb = var.nodes_os_disk_size
  }
  addon_profile {
    kube_dashboard {
      enabled = var.kube_dashboard_enabled
    }
  }
  service_principal {
    client_id     = var.service_principal_client_id
    client_secret = var.service_principal_client_secret
  }

  tags = var.tags
}