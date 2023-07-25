module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.1.0"

  name                = var.vpc_name
  cidr                = var.vpc_cidr
  azs                 = var.azs
  public_subnets      = var.vpc_public_subnets
  public_subnet_tags  = var.public_subnet_tags
  private_subnets     = var.vpc_private_subnets
  private_subnet_tags = var.private_subnet_tags

  enable_nat_gateway     = var.enable_nat_gateway
  single_nat_gateway     = var.single_nat_gateway
  one_nat_gateway_per_az = var.one_nat_gateway_per_az

  tags = var.tags
}
