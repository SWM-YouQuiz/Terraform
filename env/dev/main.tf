terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.8.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "../../modules/vpc"

  vpc_name             = var.vpc_name
  cidr_numeral_public  = var.cidr_numeral_public
  cidr_numeral_private = var.cidr_numeral_private
  cidr_numeral         = var.cidr_numeral
}
