resource "helm_release" "ingresscontroller_nginx" {

  count = length(var.ingress_controllers)

  name       = element(var.ingress_controllers.*.name, count.index)
  repository = "https://kubernetes.github.io/ingress-nginx"
  chart      = "ingress-nginx"
  version    = var.chart_version
  namespace  = var.namespace
  timeout    = var.helm_timeout

  set {
    name  = "controller.replicaCount"
    value = lookup(element(var.ingress_controllers, count.index), "replicas", local.defaults.replicas)
  }
  set {
    name  = "controller.ingressClass"
    value = lookup(element(var.ingress_controllers, count.index), "ingress_class", local.defaults.ingress_class)
  }
  set {
    name  = "controller.service.enableHttp"
    value = lookup(element(var.ingress_controllers, count.index), "enable_http", local.defaults.enable_http)
  }
  set {
    name  = "controller.service.enableHttps"
    value = lookup(element(var.ingress_controllers, count.index), "enable_https", local.defaults.enable_https)
  }
  set {
    name  = "controller.config.log-format-upstream"
    value = lookup(element(var.ingress_controllers, count.index), "log_format", local.defaults.log_format)
  }

  # ---------------------------------- Default Cert ---------------------------------- #
  dynamic "set" {
    for_each = lookup(element(var.ingress_controllers, count.index), "default_cert", null) == null ? [] : [1]
    content {
      name  = "controller.extraArgs.default-ssl-certificate"
      value = element(var.ingress_controllers.*.default_cert, count.index)
    }
  }
  # ------------------------------ Other Configurations ------------------------------ #
  dynamic "set" {
    for_each = lookup(element(var.ingress_controllers, count.index), "other_configurations", null) == null ? [] : element(var.ingress_controllers.*.other_configurations, count.index)
    content {
      name  = set.value.name
      value = set.value.value
    }
  }
  # ---------------------------------- Annotations ----------------------------------- #
  dynamic "set" {
    for_each = lookup(element(var.ingress_controllers, count.index), "annotations", null) == null ? [] : element(var.ingress_controllers.*.annotations, count.index)
    content {
      name  = "controller.service.annotations.${replace(set.value.name, ".", "\\.")}"
      value = set.value.value
    }
  }
}