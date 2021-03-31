variable "namespace" {}
variable "chart_version" { default = "2.11.3" } # https://github.com/kubernetes/ingress-nginx/tree/master/charts/ingress-nginx
variable "ingress_controllers" {}
variable "helm_timeout" { default = 900 }