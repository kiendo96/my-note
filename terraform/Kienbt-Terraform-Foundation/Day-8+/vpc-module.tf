module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  # VPC basic Detail
  name  = "${local.name}-${var.vpc_name}"
  cidr  = var.vpc_cidr_block
  
  azs   = var.vpc_availability_zones
  
  public_subnets = var.vpc_public_subnets
  private_subnets = var.vpc_private_subnets


  # Database subnets
  database_subnets = var.vpc_database_subnets
  create_database_subnet_group = var.vpc_create_database_subnet_group

  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table

  # NAT Gateways - Outbound Communication

  enable_nat_gateway = var.vpc_enable_nat_gateway 
  single_nat_gateway = var.vpc_single_nat_gateway

  tags = local.common_tags
  vpc_tags = local.common_tags

  public_subnet_tags = {
    Type = "Public Subnets"
  }
  private_subnet_tags = {
    Type = "Private Subnets"
  }  
  database_subnet_tags = {
    Type = "Private Database Subnets"
  }
}