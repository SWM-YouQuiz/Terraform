# VPC
resource "aws_vpc" "default" {
  cidr_block           = "10.${var.cidr_numeral}.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    Name = "vpc-${var.vpc_name}"
  }
}

# Internet Gateway
resource "aws_internet_gateway" "default" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "igw-${var.vpc_name}"
  }
}


# NAT Gateway 
resource "aws_nat_gateway" "nat" {

  allocation_id = aws_eip.nat.id

  subnet_id = aws_subnet.public.0.id

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "ngw-${var.vpc_name}"
  }

}

# Elastic IP for NAT Gateway 
resource "aws_eip" "nat" {
  vpc = true

  lifecycle {
    create_before_destroy = true
  }
}
