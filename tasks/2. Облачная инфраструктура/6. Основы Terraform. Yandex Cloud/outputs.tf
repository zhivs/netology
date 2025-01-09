output "vm_external_addresses" {
  value       = { 
    "${var.vm_web_name}" = format("IP:%s, FQDN:%s", resource.yandex_compute_instance.platform_web.network_interface.0.nat_ip_address, resource.yandex_compute_instance.platform_web.fqdn), 
    "${var.vm_db_name}" = format("IP:%s, FQDN:%s", resource.yandex_compute_instance.platform_db.network_interface.0.nat_ip_address, resource.yandex_compute_instance.platform_db.fqdn), 
}
  description = "Extermal IPs of VMs."
}