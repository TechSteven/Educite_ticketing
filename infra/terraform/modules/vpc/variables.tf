variable "vpc_cidr" {
  description = "The IP range for our private network"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The IP range for our public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The IP range for our private/backend services"
  type        = string
  # We don't put a default here so the Root is forced to define it
}

variable "az" {
  type    = string
  default = "us-east-1a"
}