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
    ip_address = "192.168.101.2"
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
    ip_address = "192.168.101.3"
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
    ip_address = "192.168.101.4"
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
    ip_address = "192.168.101.5"
  
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
    ip_address = "192.168.101.6"
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

resource "yandex_compute_snapshot" "snapshot-1" {

  name           = "disk-snapshot"
  source_disk_id = ["${yandex_compute_snapshot.snapshot-1.id}"]
}



