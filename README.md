# Terraform-Modules

## Modules
- Azure:
  - [AKS](azure/aks/README.md): Azure Kubernetes Service
- Kubernetes:
  - Apps:
    - [Generic]](kubernetes/apps/generic/README.md): Generic Applications
  - Ingress:
    - [Nginx-Controller](kubernetes/ingress/nginx-controller/README.md): Nginx - Ingress Controller

### Versions

To specify a version (repository tag):
```bash
source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/ingress/nginx-controller?ref=<tag>"
```

For example:
```bash
source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/ingress/nginx-controller?ref=kubernetes/ingress/nginx-controller-X.XX.XX"
```