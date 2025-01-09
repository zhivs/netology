module "vpc_dev" {
  source         = "./modules/vpc_dev"
  env_name       = "develop"
  zone           = "ru-central1-a"
  cidr           = ["10.0.1.0/24"]
}

module "analytics_vm" {
  source         = "git::https://github.com/udjin10/yandex_compute_instance.git?ref=main"
  env_name       = var.module_analytics_env_name
  network_id     = module.vpc_dev.vpc_network_develop.id
  subnet_zones   = var.module_analytics_subnet_zones
  subnet_ids     = [module.vpc_dev.vpc_subnet_develop_a.id]
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
