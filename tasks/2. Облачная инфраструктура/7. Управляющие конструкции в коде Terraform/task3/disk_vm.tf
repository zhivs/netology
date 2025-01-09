resource "yandex_compute_disk" "test_disk" {
  count    = 3
  name     = "${var.disk_name}-${count.index+1}"
  type     = var.vm_disk_type
  image_id = data.yandex_compute_image.ubuntu.image_id

  size    = var.disk_size 
}


#Вм с 3 дисками
resource "yandex_compute_instance" "storage" {
  name        = "${var.vm_name}-storage"
  platform_id = var.vm_platform_id

  resources {
    cores         = var.vm_resources.cores 
    memory        = var.vm_resources.memory
    core_fraction = var.vm_resources.core_fraction
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
      type     = var.vm_disk_type
      size     = var.vm_disk_size
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

  allow_stopping_for_update = true

  dynamic "secondary_disk" {
    for_each = yandex_compute_disk.test_disk
    content {
      disk_id     = secondary_disk.value.id
    }
  }
}
