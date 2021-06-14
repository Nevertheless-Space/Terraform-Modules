# Kubernetes Generic Jobs

- For the default values see: `defaults.tf`
- For the input variables see: `inputs.tf`
- For the terraform providers versions see: `terraform.tf`

The commented fields are optional.

## Usage Example
```bash
module "generic-jobs" {

  source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/jobs/generic"
  
  namespace = "default"
  jobs = [{
    name = "test"
    image = "ubuntu"
    # args = []
    command = split(" ", "echo \"test!\"")
    # env_variables = [
    #   {
    #     name = "var_1"
    #     value = "value_1"
    #   }
    # ]
    # labels = {}
    # config_map = {
    #   mount_path = "/usr/share/nginx/html"
    #   data = {
    #     "index.html" = "${file("./assets/nginx-01/index.html")}"
    #   }
    #   # binary_data = {}
    # }
    # backoff_limit = 4
    # wait_for_completion = true
    # completion_timeout = 300 # seconds
  }]
}
```