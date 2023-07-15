provider "aws" {
  region = var.aws_region
}

module "dev" {
  source = "./dev"
}
