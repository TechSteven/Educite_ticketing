variable "vpc_cidr_root" {}
variable "public_cidr_root" {}
variable "private_cidr_root" {}
variable "project_name_root" {}
variable "frontend_port_root" {}
variable "backend_ports_root" {
  type        = list(number)
  description = "The list of ports for our backend microservices"
}

variable "az_root" {
  type        = string
  description = "The target availability zone"
}