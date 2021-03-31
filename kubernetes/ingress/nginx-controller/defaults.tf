locals {
  defaults = {
    replicas = 1
    ingress_class = "nginx"
    enable_http = true
    enable_https = true
    log_format = "$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent \"$http_referer\" \"$http_user_agent\" \"$http_x_forwarded_for\" \"$host\" \"$http_x_forwarded_host\" \"$http_x_forwarded_proto\""
  }
}