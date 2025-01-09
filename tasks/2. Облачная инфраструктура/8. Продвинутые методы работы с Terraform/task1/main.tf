resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
#создаем подсеть
resource "yandex_vpc_subnet" "develop_a" {
  name           = "develop-ru-central1-a"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.1.0/24"]
}

resource "yandex_vpc_subnet" "develop_b" {
  name           = "develop-ru-central1-b"
  zone           = "ru-central1-b"
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = ["10.0.2.0/24"]
}


module "marketing_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.module_marketing_env_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = var.module_marketing_subnet_zones
  subnet_ids     = [yandex_vpc_subnet.develop_a.id, yandex_vpc_subnet.develop_b.id]
  instance_name  = var.module_marketing_instance_name
  instance_count = 2
  image_family   = var.vm_image_family
  public_ip      = var.module_marketing_is_ip

  labels = var.module_marketing_labels

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }
}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.module_analytics_env_name
  network_id     = yandex_vpc_network.develop.id
  subnet_zones   = var.module_analytics_subnet_zones
  subnet_ids     = [yandex_vpc_subnet.develop_a.id]
  instance_name  = var.module_analytics_instance_name
  instance_count = 1
  image_family   = var.vm_image_family
  public_ip      = var.module_analytics_is_ip

  metadata = {
    user-data          = data.template_file.cloudinit.rendered
    serial-port-enable = 1
  }

  labels = var.module_analytics_labels
}

data "template_file" "cloudinit" {
    template = file("${path.module}/cloud-init.yml")
    vars = {
      ssh_public_key     = file(var.ssh_key_path)
    }
}
