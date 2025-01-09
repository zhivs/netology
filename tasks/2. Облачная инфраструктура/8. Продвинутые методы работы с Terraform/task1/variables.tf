###cloud vars
variable "token" {
  type        = string
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}
variable "default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}

variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}

###common vars

variable "vm_image_family" {
  type        = string
  default     = "ubuntu-2004-lts"
}

### modules settings

variable "module_marketing_env_name" {
  type        = string
  default     = "develop"
  description = "module marketing env name"
}

variable "module_marketing_subnet_zones" {
  type    = list
  default = ["ru-central1-a","ru-central1-b"]
}

variable "module_marketing_instance_name" {
  type        = string
  default     = "webs"
}

variable "module_marketing_is_ip" {
  default = true
}

variable "module_marketing_labels" {
  type = map
  default = {
    "owner"  = "zhivs"
    "project"  = "marketing"
  }
}

variable "module_analytics_env_name" {
  type        = string
  default     = "stage"
  description = "module marketing env name"
}

variable "module_analytics_instance_name" {
  type        = string
  default     = "web-stage"
}

variable "module_analytics_is_ip" {
  default = true
}

variable "module_analytics_labels" {
  type = map
  default = {
    "owner"    = "zhivs"
    "project"  = "analitics"
  }
  
}

variable "module_analytics_subnet_zones" {
  type    = list
  default = ["ru-central1-a"]
}

variable "ssh_key_path" {
  type = string
  default = "./ssh"
}
