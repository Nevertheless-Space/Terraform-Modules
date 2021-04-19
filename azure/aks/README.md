## AKS - Azure (Managed) Kubernetes Service

### Usage Example

```bash
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 2.52.0"
    }
  }
}
provider "azurerm" {
  subscription_id = ...
  client_id       = ...
  client_secret   = ...
  tenant_id       = ...

  features {}
}
module "aks" {

  source = "git::https://github.com/nevertheless-space/terraform-modules//azure/aks"

  tenant = "example"
  env = "test"
  tags = {
    Tenant = "example"
    Environment = "test"
  }
  service_principal_client_id = ...
  service_principal_client_secret = ...
}
output "kube_config" {
  value = module.aks.kube_config
}
```

### Default Values

```bash
variable "location" { default = "North Europe" }
variable "nodes_sku" { default = "Standard_D2_v2" }
variable "nodes_count" { default = 3 }
variable "k8s_version" { default = "1.18.14" }
variable "nodes_os_disk_size" { default = 30 }
variable "kube_dashboard_enabled" { default = false }
```

### Outputs

[Azure Provider Documentation](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster#kube_config):
- id
- fqdn
- private_fqdn
- kube_admin_config
- kube_admin_config_raw
- kube_config
- kube_config_raw
- node_resource_group
- kubelet_identity
