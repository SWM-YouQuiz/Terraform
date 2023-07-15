variable "cidr_numeral" {
  description = "The VPC CIDR numeral (10.x.0.0/16)"
  default     = 0
}

variable "vpc_name" {
  type = string
  default = "youq-dev"
}

variable "availability_zones" {
  type    = list(string)
  default = ["ap-northeast-2a", "ap-northeast-2c"]
}

variable "cidr_numeral_public" {
  default = {
    "0" = "0"
    "1" = "16"
  }
}

variable "cidr_numeral_private" {
  default = {
    "0" = "128"
    "1" = "144"
  }
}
