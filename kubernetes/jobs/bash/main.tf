module "generic-job" {

  count = length(var.specs)
  source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/jobs/generic?ref=kubernetes/jobs/generic-0.1.0"
  
  namespace = var.namespace
  jobs = [
    {
      name = "${lookup(element(var.specs, count.index), "name", local.defaults.name)}"
      image = "${lookup(element(var.specs, count.index), "image", local.defaults.image)}"
      args = ["echo \"$(cat /tmp/script.sh)\" > /home/script.sh; cd /home; chmod +x ./script.sh; ./script.sh"]
      command = ["bash", "-c"]
      config_map = {
        mount_path = "/tmp"
        data = {
          "script.sh" = element(var.specs.*.commands, count.index)
        }
      }
      labels = lookup(element(var.specs, count.index), "labels", local.defaults.labels)
      backoff_limit = lookup(element(var.specs, count.index), "backoff_limit", local.defaults.backoff_limit)
      wait_for_completion = lookup(element(var.specs, count.index), "wait_for_completion", local.defaults.wait_for_completion)
      completion_timeout = lookup(element(var.specs, count.index), "completion_timeout", local.defaults.completion_timeout)
    }
  ]
}