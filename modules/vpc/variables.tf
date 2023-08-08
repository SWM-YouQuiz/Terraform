variable "vpc_name" {
  type = string
}

variable "vpc_cidr" {
  description = "Default value for VPC CIDR"
  type        = string
  default     = "172.31.0.0/16"
}

variable "azs" {
  description = "Availability zones for the region"
  type        = list(string)
}

variable "vpc_public_subnets" {
  description = "Public subnets for the VPC"
  type        = list(string)
}

variable "public_subnet_tags" {
  type = map(string)
}

variable "vpc_private_subnets" {
  description = "Private subnets for the VPC"
  type        = list(string)
}

variable "private_subnet_tags" {
  type = map(string)
}

variable "enable_nat_gateway" {
  type = bool
}

variable "single_nat_gateway" {
  type = bool
}

variable "one_nat_gateway_per_az" {
  type = bool
}

variable "tags" {
  type = map(string)
}
