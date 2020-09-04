variable "subnet_vpc" {
  default = "10.80.80.0/22"
}

variable "subnet_dmz" {
  default = "10.80.81.0/25"
}

variable "subnet_internal" {
  default = "10.80.82.0/24"
}

variable "my_public_ip" {
  default = "70.160.122.188"
}