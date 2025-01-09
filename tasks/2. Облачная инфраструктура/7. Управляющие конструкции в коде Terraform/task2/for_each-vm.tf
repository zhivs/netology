#создаем 2 идентичные ВМ во внутренней или внешней сети в зависимости от бастиона
resource "yandex_compute_instance" "web_servs_each" {
  for_each = tomap({
    for t in var.each_vm :
    "${t.vm_name}:${t.cores}:${t.memory}:${t.core_fraction}" => t
  })


  name        = "${var.vm_name}-${each.value.vm_name}"
  platform_id = var.vm_platform_id

  resources {
    cores         = each.value.cores
    memory        = each.value.memory
    core_fraction = each.value.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_disc_type
      size     = each.value.disk_volume
    }
  }

  scheduling_policy { preemptible = var.vm_is_preemptible }

  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    security_group_ids = [yandex_vpc_security_group.example.id]
  }

  metadata = {
    ssh-keys = local.ssh-key
    serial-port-enable = local.serial-port-enable
  }
}
