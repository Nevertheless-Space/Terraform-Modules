# Kubernetes Bash Jobs

- For the default values see: `defaults.tf`
- For the input variables see: `inputs.tf`
- For the terraform providers versions see: `terraform.tf`

## Usage Example

The commented fields are optional.

```bash
module "bash-jobs" {

  source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/jobs/bash"
  
  # namespace = "default"
  specs = [{
    # name = "test"
    # image = "ubuntu:20.04"
    commands = "echo \"prova1\"; dir; cd /etc; dir"
    # labels = {}
    # backoff_limit = 4
    # wait_for_completion = true
    # completion_timeout = 300 # seconds
  }]
}
```