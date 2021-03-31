## AKS - Azure (Managed) Kubernetes Service

### Usage Example

#### Basic
```bash
module "nginx_controller" {

  source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/ingress/nginx-controller"
  
  namespace = "nginx-ingress-controller"
  ingress_controllers = [
    {
      name = "test"
    },
  ]
}
```

#### Complex
```bash
module "nginx_controller" {

  source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/ingress/nginx-controller"
  
  namespace = "nginx-ingress-controller"
  chart_version = "2.11.3" # https://github.com/kubernetes/ingress-nginx/tree/master/charts/ingress-nginx
  ingress_controllers = [
    {
      name = "test"
      ingress_class = "nginx-test"
      enable_http = false
      enable_https = true
      log_format = "[$time_local] $remote_addr - $remote_user \"$request\" $status $body_bytes_sent \"$http_referer\" \"$http_user_agent\" \"$http_x_forwarded_for\" \"$host\" \"$http_x_forwarded_host\" \"$http_x_forwarded_proto\""
      other_configurations = [ # https://kubernetes.github.io/ingress-nginx/user-guide/nginx-configuration/configmap/
        {
          name = "controller.config.proxy-buffer-size"
          value = "16k"
        },
        {
          name = "controller.config.proxy-buffers"
          value = "4 16k"
        },
        {
          name = "proxy-busy-buffers-size"
          value = "16k"
        },
        {
          name = "use-forwarded-headers"
          value = "true"
        }
      ]
      annotations = [
        {
          name = "test.annotation"
          value = "example"
        }
      ]
    },
    {
      name = "test-2"
      
          ...

    },
  ]
}
```

### Default Values

Controller:
```bash
chart_version = "2.11.3" # https://github.com/kubernetes/ingress-nginx/tree/master/charts/ingress-nginx
helm_timeout = 900
{
  replicas = 1
  default_cert = none # namespace/secret_name
  ingress_class = "nginx"
  enable_http = true
  enable_https = true
  log_format = "$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent \"$http_referer\" \"$http_user_agent\" \"$http_x_forwarded_for\" \"$host\" \"$http_x_forwarded_host\" \"$http_x_forwarded_proto\""
  other_configurations = []
  annotations = []
}
```

### Versions

To specify a versione (repository tag):
```bash
source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/ingress/nginx-controller?ref=<tag>"
```

For example:
```bash
source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/ingress/nginx-controller?ref=kubernetes/ingress/nginx-controller-X.XX.XX"
```