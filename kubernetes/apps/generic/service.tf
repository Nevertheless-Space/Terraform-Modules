locals {
  services = [for x in var.apps: x if lookup(x, "service_ports", null) != null]
}
resource "kubernetes_service" "app_service" {

  count = length(local.services)

  metadata {
    name = element(local.services.*.name, count.index)
    namespace = var.namespace
  }
  spec {
    selector = {
      app = element(local.services.*.name, count.index)
    }
    dynamic "port" {
      for_each = lookup(element(var.apps, count.index), "service_ports", [])
      content {
        name = lookup(port.value, "name", "${lower(lookup(port.value, "protocol", "TCP"))}-${port.value.port}")
        port = port.value.port
        target_port = lookup(port.value, "target_port", port.value.port)
        protocol = lookup(port.value, "protocol", "TCP")
      }
    }
    type = lookup(element(local.services, count.index), "service_type", "ClusterIP")
  }
}