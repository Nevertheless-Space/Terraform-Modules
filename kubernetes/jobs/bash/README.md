# Kubernetes Bash Jobs

- For the default values see: `defaults.tf`
- For the input variables see: `inputs.tf`
- For the terraform providers versions see: `terraform.tf`

## Usage Example

The commented fields are optional.

```bash
module "bash-jobs" {

  # source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/jobs/bash"
  source = "gitlab.com/nevertheless.space/bash/kubernetes-jobs"
  version = "0.2.0" # https://gitlab.com/nevertheless.space/Terraform-Modules/-/infrastructure_registry?sort=desc&orderBy=created_at&search[]=bash%2Fkubernetes-jobs&search[]=
  
  # namespace = "default"
  specs = [{
    # name = "test"
    # image = "ubuntu:20.04"
    # env_variables = []
    # interpreter_commands = "sh -c" # default: "bash -c"
    commands = "echo \"prova1\"; dir; cd /etc; dir"
    # labels = {}
    # backoff_limit = 4
    # wait_for_completion = true
    # completion_timeout = 300 # seconds
  }]
}
```