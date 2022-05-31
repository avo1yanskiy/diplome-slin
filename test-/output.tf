output "internal_ip_address_virtual_machine_1" {
  value = yandex_compute_instance.virtual-machine-1.network_interface.0.ip_address
}

output "internal_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.ip_address
}

output "internal_ip_address_vm_3" {
  value = yandex_compute_instance.vm-3.network_interface.0.ip_address
}

output "internal_ip_address_vm_4" {
  value = yandex_compute_instance.vm-4.network_interface.0.ip_address
}


output "internal_ip_address_vm_7" {
  value = yandex_compute_instance.vm-7.network_interface.0.ip_address
}

output "internal_ip_address_vm_8" {
  value = yandex_compute_instance.vm-8.network_interface.0.ip_address
}

output "external_ip_address_virtual_machine_1" {
  value = yandex_compute_instance.virtual-machine-1.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_2" {
  value = yandex_compute_instance.vm-2.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_3" {
  value = yandex_compute_instance.vm-3.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_4" {
  value = yandex_compute_instance.vm-4.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_7" {
  value = yandex_compute_instance.vm-7.network_interface.0.nat_ip_address
}

output "external_ip_address_vm_8" {
  value = yandex_compute_instance.vm-8.network_interface.0.nat_ip_address
}