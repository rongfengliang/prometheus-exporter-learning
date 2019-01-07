listen {
  port = 4040
  address = "0.0.0.0"
}

consul {
  enable = false
  address = "localhost:8500"
  datacenter = "dc1"
  scheme = "http"
  token = ""
  service {
    id = "nginx-exporter"
    name = "nginx-exporter"
    tags = ["foo", "bar"]
  }
}

namespace "app1" {
  format = "$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent \"$http_referer\" \"$http_user_agent\" \"$http_x_forwarded_for\""
  source_files = [
    "/nginx-logs/access.log"
  ]
  labels {
    app = "application-one"
    environment = "production"
    foo = "bar"
  }
}