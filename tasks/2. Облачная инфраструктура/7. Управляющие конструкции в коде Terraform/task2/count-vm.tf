#создаем 2 идентичные ВМ во внутренней или внешней сети в зависимости от бастиона
resource "yandex_compute_instance" "web_servs_count" {
  count = 2

  name        = "${var.vm_name}-${count.index+1}"
  platform_id = var.vm_platform_id

  resources {
    cores         = var.vm_resources.cores
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_disc_type
      size     = var.vm_disc_size
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

  depends_on = [
    yandex_compute_instance.web_servs_each
  ]

}
