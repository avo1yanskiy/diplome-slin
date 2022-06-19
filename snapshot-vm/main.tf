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

resource "yandex_compute_snapshot" "elasticsearch" {

  name           = "elasticsearch"
  source_disk_id = "<идентификатор диска>"
}

resource "yandex_compute_snapshot" "kibana" {

  name           = "kibana"
  source_disk_id = "<идентификатор диска>"
}

resource "yandex_compute_snapshot" "grafana" {

  name           = "grafana"
  source_disk_id = "<идентификатор диска>"
}

resource "yandex_compute_snapshot" "http-1" {

  name           = "http-1"
  source_disk_id = "<идентификатор диска>"
}

resource "yandex_compute_snapshot" "http-2" {

  name           = "http-2"
  source_disk_id = "<идентификатор диска>"
}

resource "yandex_compute_snapshot" "prometheus" {

  name           = "prometheus"
  source_disk_id = "<идентификатор диска>"
}

resource "yandex_compute_snapshot" "bastion" {

  name           = "bastion"
  source_disk_id = "<идентификатор диска>"
}