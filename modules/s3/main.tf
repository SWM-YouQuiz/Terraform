resource "aws_s3_bucket" "swagger" {
  bucket = "quizit-swagger"
}

resource "aws_s3_bucket_cors_configuration" "swagger" {
  bucket = aws_s3_bucket.swagger.id

  cors_rule {
    allowed_headers = [""]
    allowed_methods = ["GET"]
    allowed_origins = ["*"]
  }
}

resource "aws_s3_bucket_public_access_block" "swagger" {
  bucket                  = aws_s3_bucket.swagger.id
  block_public_acls       = true
  block_public_policy     = false
  ignore_public_acls      = true
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "swagger" {
  bucket = aws_s3_bucket.swagger.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect    = "Allow",
        Principal = "*",
        Action    = "s3:GetObject",
        Resource  = "${aws_s3_bucket.swagger.arn}/*"
      }
    ]
  })
}
