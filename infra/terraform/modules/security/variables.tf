variable "vpc_id" {
  description = "The VPC where these security groups will live"
  type        = string
}

variable "project_name" {
  type    = string
  default = "ticketing"
}

variable "frontend_port" {
  type    = number
  default = 80
}

variable "backend_ports" { # <--- Ensure this is plural
  type    = list(number)
  default = [8001, 8002, 8003]
}