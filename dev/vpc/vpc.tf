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
  count = length(var.availability_zones)

  allocation_id = element(aws_eip.nat.*.id, count.index)

  subnet_id = element(aws_subnet.public.*.id, count.index)

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "ngw-${count.index}-${var.vpc_name}"
  }

}

# Elastic IP for NAT Gateway 
resource "aws_eip" "nat" {

  count = length(var.availability_zones)
  vpc   = true

  lifecycle {
    create_before_destroy = true
  }
}
