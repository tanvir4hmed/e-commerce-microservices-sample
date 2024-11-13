# main.tf (Root Module)

module "vpc" {
  source          = "../../modules/vpc"
  region          = var.region
  main_vpc_cidr   = var.main_vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}

module "security_group" {
  source        = "../../modules/security_group"
  vpc_id        = module.vpc.vpc_id
}

module "ec2" {
  source            = "../../modules/ec2"
  region            = var.region
  ec2_ami_id        = var.ec2_ami_id
  ec2_instance_type = var.ec2_instance_type
  security_group_id = module.security_group.security_group_id
  subnet_id         = module.vpc.public_subnet_id
  key_name          = var.key_name  # Pass key_name to the EC2 module
}
