# Postgresql DB

- For the default values see: `defaults.tf`
- For the input variables see: `inputs.vars.tf`
- For the terraform providers versions see: `terraform.tf`

## Example
The commented fields are optional.
```bash
module "postgresql" {

  source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/apps/postgresql"

  # chart_version = "10.4.2"
  namespace = "postgresql"
  # specs = {
  #   # name = "postgresql"

  #   # username = "postgres"
  #   # password = "postgres"
  #   # storage_class = "default"

  #   # other_configurations = { # https://github.com/bitnami/charts/tree/master/bitnami/postgresql
  #   #   "key": "value"
  #   # }
  # }
}
```