###VM vars
##metadata
variable "metadata" {
    type    = map(string)
    default = {
        serial-port-enable = 1,
        ssh-keys = "ubuntu:ssh-ed25519 "
    }
}
##vms resources
variable "vms_resources" {
    type = map(object({
        cores         = number
        memory        = number
        core_fraction = number
    }))
    default = {
        web = {
            cores = 2,
            memory = 1,
            core_fraction = 5
        },
        db = {
            cores = 2, 
            memory = 2, 
            core_fraction = 20
        }
    }
}

##web VM
variable "vm_web_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "The name of the image family to which this image belongs."
}

variable "vm_web_name" {
  type        = string
  default     = "platform-web"
  description = "VM name"
}

variable "vm_web_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "The type of virtual machine to create. The default is 'standard-v1"
}

# variable "vm_web_resources" {
#   type        = object({cores = number, memory = number, core_fraction = number})
#   default     = {cores = 2, memory = 1, core_fraction = 5}
#   description = "Compute resources that are allocated for the instance"  
# }

variable "vm_web_is_preemptible" {
  type = bool
  default = true
  description = "Specifies if the instance is preemptible"
}

variable "vm_web_is_nat" {
  type = bool
  default = true
  description = "Specifies if the instance is nat"
}

##db VM
#Vm settings
variable "vm_db_family" {
  type        = string
  default     = "ubuntu-2004-lts"
  description = "The name of the image family to which this image belongs."
}

variable "vm_db_name" {
  type        = string
  default     = "platform-db"
  description = "VM name"
}

variable "vm_db_platform_id" {
  type        = string
  default     = "standard-v1"
  description = "The type of virtual machine to create. The default is 'standard-v1"
}

# variable "vm_db_resources" {
#   type        = object({cores = number, memory = number, core_fraction = number})
#   default     = {cores = 2, memory = 2, core_fraction = 20}
#   description = "Compute resources that are allocated for the instance"  
# }

variable "vm_db_is_preemptible" {
  type = bool
  default = true
  description = "Specifies if the instance is preemptible"
}

#net settings
variable "vm_db_is_nat" {
  type = bool
  default = true
  description = "Specifies if the instance is nat"
}

variable "vm_db_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "https://cloud.yandex.ru/docs/overview/concepts/geo-scope"
}

variable "vm_db_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "https://cloud.yandex.ru/docs/vpc/operations/subnet-create"
}
