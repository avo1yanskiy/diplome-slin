listen {
  port = 4040
  address = "0.0.0.0"
}

namespace "app1" {
  format = "$remote_addr - $remote_user [$time_local] \"$request\" $status $body_bytes_sent \"$http_referer\" \"$http_user_agent\" \"$http_x_forwarded_for\""
  source_files = ["/var/log/nginx/access.log"]
  labels {
    app = "my-application"
    environment = "production"
    foo = "bar"
  }
}
