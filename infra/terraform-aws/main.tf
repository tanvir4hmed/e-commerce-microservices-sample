
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.region
  profile = "default"
}

module "vpc" {
  source             = "./modules/vpc"
  project            = var.project
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones
}

module "networking" {
  source              = "./modules/networking"
  project             = var.project
  vpc_id              = module.vpc.vpc_id
  vpc_cidr            = var.vpc_cidr
  availability_zones  = var.availability_zones
  public_subnet_1_id  = module.vpc.public_subnet_1_id
  private_subnet_1_id = module.vpc.private_subnet_1_id
}

module "eks" {
  source              = "./modules/eks"
  project             = var.project
  vpc_id              = module.vpc.vpc_id
  public_subnet_1_id  = module.vpc.public_subnet_1_id
  private_subnet_1_id = module.vpc.private_subnet_1_id
}

module "albs" {
  source               = "./modules/networking/albs"
  project              = var.project
  region = var.region
  vpc_id               = module.vpc.vpc_id
  eks_cluster_id       = module.eks.eks_cluster_id
  eks_cluster_endpoint = module.eks.eks_cluster_endpoint
  eks_cluster_ca       = module.eks.eks_cluster_ca
  eks_provider_arn     = module.eks.eks_provider_arn
  token                = module.eks.token
}
