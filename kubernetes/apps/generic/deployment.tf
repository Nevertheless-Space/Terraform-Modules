resource "kubernetes_deployment" "deployment" {

  count = length(var.apps)

  metadata {
    name = element(var.apps.*.name, count.index)
    namespace = var.namespace
    labels = lookup(element(var.apps, count.index), "labels", {})
  }
  spec {
    replicas = lookup(element(var.apps, count.index), "replicas", 1)
    selector {
      match_labels = {
        app = element(var.apps.*.name, count.index)
      }
    }
    template {
      metadata {
        labels = merge(
          {app = element(var.apps.*.name, count.index)},
          lookup(element(var.apps, count.index), "labels", {})
        )
      }
      spec {
        container {
          image = element(var.apps.*.image, count.index)
          name  = element(var.apps.*.name, count.index)
          args = lookup(element(var.apps, count.index), "args", [])
          command = lookup(element(var.apps, count.index), "command", [])
          dynamic "port" {
            for_each = lookup(element(var.apps, count.index), "container_ports", [])
            content {
              container_port = port.value.port
              protocol = lookup(port.value, "protocol", "TCP")
            }
          }
          dynamic "env" {
            for_each = lookup(element(var.apps, count.index), "env_variables", [])
            content {
              name = env.value.name
              value = env.value.value
            }
          }
          dynamic "resources" {
            for_each = lookup(element(var.apps, count.index), "resources", null) == null ? [] : [1]
            content {
              limits = lookup(element(var.apps, count.index), "limits", {})
              requests = lookup(element(var.apps, count.index), "requests", {})
            }
          }
          dynamic "volume_mount" {
            for_each = lookup(element(var.apps, count.index), "config_map", null) == null ? [] : [1]
            content {
              name = element(var.apps.*.name, count.index)
              mount_path = lookup(element(local.config_maps.*.config_map, count.index), "mount_path", "/")
            }
          }
        }
        dynamic "volume" {
          for_each = lookup(element(var.apps, count.index), "config_map", null) == null ? [] : [1]
          content {
            name = element(var.apps.*.name, count.index)
            config_map {
              name = element(var.apps.*.name, count.index)
            } 
          }
        }
      }
    }
  }
}