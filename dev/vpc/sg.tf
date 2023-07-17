resource "aws_security_group" "default" {
  name        = "default-${var.vpc_name}"
  description = "default security group for ${var.vpc_name}"
  vpc_id      = aws_vpc.default.id
}
