# Kubernetes Generic Applications

## Usage Example

The commented fields are optional.

```bash
module "generic-apps" {

  source = "git::https://github.com/nevertheless-space/terraform-modules//kubernetes/apps/generic"
  
  namespace = "nginx"
  apps = [{
    # replicas = 1
    name = "nginx"
    image = "nginx"
    # args = []
    # command = ["dir"]
    # env_variables = [
    #   {
    #     name = "var_1"
    #     value = "value_1"
    #   }
    # ]
    # container_ports = [
    #   {
    #     port = "80"
    #     # protocol = "UDP" # default: "TCP"
    #   }
    # ]
    # service_ports = [
    #   {
    #     # name = "http" # default: "protocol" + "-" + "port"
    #     port = "80"
    #     # target_port = "80" # default: port value
    #     # protocol = "UDP" # default: "TCP"
    #   }
    # ]
    # service_type = "ClusterIP"
    # labels = {}
    # resources = {
    #   limits = {
    #     cpu    = "0.5"
    #     memory = "512Mi"
    #   }
    #   requests = {
    #     cpu    = "250m"
    #     memory = "50Mi"
    #   }
    # }
    # config_map = {
    #   mount_path = "/usr/share/nginx/html"
    #   data = {
    #     "index.html" = "${file("./assets/nginx-01/index.html")}"
    #   }
    #   # binary_data = {}
    # }
    # ingress = {
    #   ingress_class = "nginx-test"
    #   # hostname = ""
    #   # path = "/"
    #   # # service_port = "80" # default: the first container port
    #   # annotations = {}
    #   # tls = {
    #   #   hosts = []
    #   #   secret_name = "test-cert"
    #   # }
    # }
  }]
}
```