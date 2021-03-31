variable "tenant" {}
variable "env" {}
variable "location" { default = "North Europe" }
variable "tags" {}
variable "service_principal_client_id" {}
variable "service_principal_client_secret" {}
variable "nodes_sku" { default = "Standard_D2_v2" }
variable "nodes_count" { default = 3 }
variable "k8s_version" { default = "1.18.14" }
variable "nodes_os_disk_size" { default = 30 }
variable "kube_dashboard_enabled" { default = false }