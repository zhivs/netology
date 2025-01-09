
variable "vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network&subnet name"
}


variable "env_name" {
  type    = string
}

variable "zone" {
  type = string
}

variable "cidr" {
  type = list(string)
}
