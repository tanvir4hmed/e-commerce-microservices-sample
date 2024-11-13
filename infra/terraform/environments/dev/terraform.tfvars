# terraform.tfvars (Root Module)

region             = "us-east-2"
main_vpc_cidr      = "10.0.0.0/24"
public_subnets     = "10.0.0.0/26"
private_subnets    = "10.0.0.64/26"
ec2_ami_id         = "ami-0ea3c35c5c3284d82"  # Example AMI ID, replace with your actual AMI ID
ec2_instance_type  = "t2.micro"      # Example instance type
key_name           = "eCom-ohio"   # Replace with your key pair name
