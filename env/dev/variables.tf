variable "aws_region" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "availability_zones" {
  type    = list(string)
  default = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "cidr_numeral" {
  description = "The VPC CIDR numeral (10.x.0.0/16)"
}

variable "cidr_numeral_public" {
  type = map(string)
}

variable "cidr_numeral_private" {
  type = map(string)
}
