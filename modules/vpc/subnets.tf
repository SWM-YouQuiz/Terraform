#### PUBLIC SUBNETS
resource "aws_subnet" "public" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.default.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_public[count.index]}.0/20"
  availability_zone = element(var.availability_zones, count.index)

  # Public IP will be assigned automatically when the instance is launch in the public subnet
  map_public_ip_on_launch = true

  tags = {
    Name = "public${count.index}-${var.vpc_name}"
  }
}

# Route Table for public subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.default.id

  tags = {
    Name = "public-rt-${var.vpc_name}"
  }
}


# Route Table Association for public subnets
resource "aws_route_table_association" "public" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.public.*.id, count.index)
  route_table_id = aws_route_table.public.id
}


#### PRIVATE SUBNETS
resource "aws_subnet" "private" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.default.id

  cidr_block        = "10.${var.cidr_numeral}.${var.cidr_numeral_private[count.index]}.0/20"
  availability_zone = element(var.availability_zones, count.index)

  tags = {
    Name               = "private${count.index}-${var.vpc_name}"
    immutable_metadata = "{ \"purpose\": \"internal_${var.vpc_name}\", \"target\": null }"
    Network            = "Private"
  }
}

# Route Table for private subnets
resource "aws_route_table" "private" {
  count  = length(var.availability_zones)
  vpc_id = aws_vpc.default.id

  tags = {
    Name    = "private-${count.index}-rt-${var.vpc_name}"
    Network = "Private"
  }
}

# Route Table Association for private subnets
resource "aws_route_table_association" "private" {
  count          = length(var.availability_zones)
  subnet_id      = element(aws_subnet.private.*.id, count.index)
  route_table_id = element(aws_route_table.private.*.id, count.index)
}
