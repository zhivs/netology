###cloud vars
variable "token" {
  type        = string
  default     = ""
  description = "OAuth-token; https://cloud.yandex.ru/docs/iam/concepts/authorization/oauth-token"
}

variable "cloud_id" {
  type        = string
  default     = ""
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  default     = ""
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
  description = "VPC network"
}

variable "vpc_subnet_name_a" {
  type        = string
  default     = "develop-a"
  description = "subnet name"
}

variable "vpc_subnet_name_b" {
  type        = string
  default     = "develop-b"
  description = "subnet name"
}

variable "nat_gateway_name" {
  type        = string
  default     = "test-gateway"
}

variable "route_table_name" {
  type    = string
  default = "rt"
}


###ssh vars
# variable "vms_ssh_root_key" {
#   type        = string
#   default     = ""
#   description = "ssh-keygen -t ed25519"
# }
