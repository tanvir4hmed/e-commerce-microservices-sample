# variables.tf (Root Module)

variable "region" {
  description = "AWS region"
  type        = string
}

variable "main_vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "public_subnets" {
  description = "CIDR block for the public subnets"
  type        = string
}

variable "private_subnets" {
  description = "CIDR block for the private subnets"
  type        = string
}

variable "ec2_ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "ec2_instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "key_name" {
  description = "The SSH key pair name to use for EC2 instances"
  type        = string
}
