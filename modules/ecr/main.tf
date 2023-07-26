data "aws_caller_identity" "current" {}

module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  count = length(var.repository_names)

  repository_name = var.repository_names[count.index]

  repository_read_write_access_arns = [data.aws_caller_identity.current.arn]
  repository_image_tag_mutability   = "MUTABLE"
  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Keep last 30 images",
        selection = {
          tagStatus     = "tagged",
          tagPrefixList = ["v"],
          countType     = "imageCountMoreThan",
          countNumber   = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = var.tags
}
