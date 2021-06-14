# Terraform-Modules

## Modules

- Azure:
    - [AKS](azure/aks/README.md): Azure Kubernetes Service
- Kubernetes:
    - Apps:
        - [Generic](kubernetes/apps/generic/README.md): Generic Kubernetes Deployments
        - [Postgresql](kubernetes/apps/postgresql/README.md): Postgresql DB
    - Ingress:
        - [Nginx-Controller](kubernetes/ingress/nginx-controller/README.md): Nginx - Ingress Controller
    - Jobs:
        - [Generic](kubernetes/jobs/generic/README.md): Generic Kubernetes Jobs
        - [Bash](kubernetes/jobs/bash/README.md): Run a bash script as Kubernetes Jobs

### Versions

To specify a version (repository tag):
```bash
source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/ingress/nginx-controller?ref=<tag>"
```

For example:
```bash
source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/ingress/nginx-controller?ref=kubernetes/ingress/nginx-controller-X.XX.XX"
```