resource "kubernetes_job" "job" {

  count = length(var.jobs)

  metadata {
    name = element(var.jobs.*.name, count.index)
    namespace = var.namespace
    labels = lookup(element(var.jobs, count.index), "labels", {})
  }
  spec {
    template {
      metadata {
        labels = merge(
          {app = element(var.jobs.*.name, count.index)},
          lookup(element(var.jobs, count.index), "labels", {})
        )
      }
      spec {
        container {
          image = element(var.jobs.*.image, count.index)
          name  = element(var.jobs.*.name, count.index)
          args = lookup(element(var.jobs, count.index), "args", [])
          command = lookup(element(var.jobs, count.index), "command", [])
          dynamic "env" {
            for_each = lookup(element(var.jobs, count.index), "env_variables", [])
            content {
              name = env.value.name
              value = env.value.value
            }
          }
          dynamic "volume_mount" {
            for_each = lookup(element(var.jobs, count.index), "config_map", null) == null ? [] : [1]
            content {
              name = element(var.jobs.*.name, count.index)
              mount_path = lookup(element(local.config_maps.*.config_map, count.index), "mount_path", "/")
            }
          }
        }
        dynamic "volume" {
          for_each = lookup(element(var.jobs, count.index), "config_map", null) == null ? [] : [1]
          content {
            name = element(var.jobs.*.name, count.index)
            config_map {
              name = element(var.jobs.*.name, count.index)
            } 
          }
        }
        restart_policy = "Never"
      }
    }
    backoff_limit = lookup(element(var.jobs, count.index), "backoff_limit", local.defaults.backoff_limit)
  }
  wait_for_completion = lookup(element(var.jobs, count.index), "wait_for_completion", local.defaults.wait_for_completion)
  timeouts {
    create = "${lookup(element(var.jobs, count.index), "completion_timeout", local.defaults.completion_timeout)}s"
    update = "${lookup(element(var.jobs, count.index), "completion_timeout", local.defaults.completion_timeout)}s"
  } 
}