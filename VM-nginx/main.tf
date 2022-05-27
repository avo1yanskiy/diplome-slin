terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "AQAAAABYXzwUAATuwScIJzAPv0G3nSn89s-L6EQ"
  cloud_id  = "b1gkdhnrl4d9t6mveu21"
  folder_id = "b1guvngenjnqosl63v2v"
  zone      = "ru-central1-a"
}

#<настройки провайдера>

resource "yandex_compute_instance" "vm-1" {
  name = "www-1"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts7j40q5b9rpjr"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

resource "yandex_compute_instance" "vm-2" {
  name = "www-2"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "fd87kbts7j40q5b9rpjr"
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

resource "yandex_iam_service_account" "main" {
  name        = "main"
  description = "service account"
}

resource "yandex_resourcemanager_folder_iam_binding" "editor" {
  folder_id = "b1guvngenjnqosl63v2v"
  role      = "editor"
  members   = [
    "serviceAccount:${yandex_iam_service_account.main.id}",
  ]
}

resource "yandex_compute_instance_group" "ig-1" {
  name               = "fixed-ig-with-balancer"
  folder_id          = "<идентификатор каталога>"
  service_account_id = "${yandex_iam_service_account.main.id}"
    resources {
      memory = "2"
      cores  = "2"
    }
  }
    boot_disk {
      mode = "READ_WRITE"
      initialize_params {
        image_id = "fd87kbts7j40q5b9rpjr"
      }
    }

    network_interface {
      network_id = "${yandex_vpc_network.network1.id}"
      subnet_ids = ["${yandex_vpc_subnet.subnet-1.id}"]
    }

metadata = {
    user-data = "${file("./meta.txt")}"
  }

scale_policy {
    fixed_scale {
      size = "2"
    }
  }

  allocation_policy {
    zones = ["ru-central1-a"]
  }

  deploy_policy {
    max_unavailable = 1
    max_expansion   = 0
  }

  load_balancer {
    target_group_name        = "target-group"
    target_group_description = "load balancer target group"
  }
}

resource "yandex_vpc_network" "network1" {
  name = "backnetwork"
}

resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network1.id
  v4_cidr_blocks = ["192.168.100.0/24"]
}
