terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "AQAAAABYXzwUAATuwScIJzAPv0G3nS"
  cloud_id  = "b1gkdhnrl4d9t6mveu21"
  folder_id = "b1guvngenjnqosl63v2v"
  zone      = "ru-central1-a"
}

resource "yandex_compute_instance" "virtual-machine-1" {
  name = "elasticsearch"
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts7j40q5b9rpjr"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
    ip_address = "192.168.101.3"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

resource "yandex_compute_instance" "virtual-machine-2" {
  name = "grafana"
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts7j40q5b9rpjr"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
    ip_address = "192.168.101.4"
  }

metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

resource "yandex_compute_instance" "virtual-machine-3" {
  name = "prometheus"
  zone = "ru-central1-a"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts7j40q5b9rpjr"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
    ip_address = "192.168.101.5"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

resource "yandex_compute_instance" "virtual-machine-4" {
  name = "http-1"
  zone = "ru-central1-a"
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts7j40q5b9rpjr"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
    ip_address = "192.168.101.6"
  
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

resource "yandex_compute_instance" "virtual-machine-5" {
  name = "http-2"
  zone = "ru-central1-b"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts7j40q5b9rpjr"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet-2.id}"
    nat       = true
    ip_address = "192.168.100.3"
    
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

resource "yandex_compute_instance" "virtual-machine-6" {
  name = "kibana"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts7j40q5b9rpjr"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
    nat       = true
    ip_address = "192.168.101.7"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

resource "yandex_compute_instance" "virtual-machine-7" {
  name = "bastion"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts7j40q5b9rpjr"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.subnet-1.id}"
    nat       = true
    ip_address = "192.168.101.100"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

resource "yandex_vpc_network" "network1" {
  name = "NETWORKBACK"
}

resource "yandex_vpc_subnet" "subnet-2" {
  name       = "subnet2"
  zone       = "ru-central1-b"
  network_id = yandex_vpc_network.network1.id
  v4_cidr_blocks = ["192.168.100.0/24"]

}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network1.id
  v4_cidr_blocks = ["192.168.101.0/24"]
}

resource "yandex_alb_target_group" "http-yandex" {
  name           = "http-yandex"

  target {
    subnet_id    = "${yandex_vpc_subnet.subnet-2.id}"
    ip_address   = "192.168.100.3"
  }

  target {
    subnet_id    = "${yandex_vpc_subnet.subnet-1.id}"
    ip_address   = "192.168.101.6"
  }
}

resource "yandex_alb_backend_group" "test-backend-group" {
  name                     = "test-backend"

  http_backend {
    name                   = "backend1"
    weight                 = 1
    port                   = 80
    target_group_ids       = ["${yandex_alb_target_group.http-yandex.id}"]
    load_balancing_config {
      panic_threshold      = 90
    }    
    healthcheck {
      timeout              = "10s"
      interval             = "2s"
      healthy_threshold    = 10
      unhealthy_threshold  = 15 
      http_healthcheck {
        path               = "/"
      }
    }
  }
}

resource "yandex_alb_http_router" "tf-router" {
  name      = "my-http-router"
  labels = {
    tf-label    = "tf-label-value"
    empty-label = ""
  }
}

resource "yandex_alb_virtual_host" "my-virtual-host" {
  name      = "my-virtual-host"
  http_router_id = yandex_alb_http_router.tf-router.id
  route {
    name = "my-route"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.test-backend-group.id
        timeout = "3s"
      }
    }
  }
}

resource "yandex_alb_load_balancer" "test-balancer" {
  name        = "my-load-balancer"
  network_id  = yandex_vpc_network.network1.id

  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.subnet-1.id
    }
  }

  listener {
    name = "http"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [ 80 ]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.tf-router.id
      }
    }
  }
}

resource "yandex_vpc_security_group" "test-sg" {
  name        = "Security group"
  description = "for security group"
  network_id  = yandex_vpc_network.network1.id

  ingress {
    protocol       = "TCP"
    description    = "Rule 1"
    v4_cidr_blocks = ["192.168.100.0/24", "192.168.101.0/24"]
    port           = 22
  }
}