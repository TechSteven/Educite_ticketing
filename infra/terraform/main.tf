module "networking" {
  source              = "./modules/vpc"
  vpc_cidr            = var.vpc_cidr_root
  public_subnet_cidr  = var.public_cidr_root
  private_subnet_cidr = var.private_cidr_root
  az                  = var.az_root # <--- Passing the AZ variable
}

module "security" {
  source        = "./modules/security"
  vpc_id        = module.networking.vpc_id
  project_name  = var.project_name_root
  frontend_port = var.frontend_port_root
  backend_ports = var.backend_ports_root # <--- Passing the LIST variable
}