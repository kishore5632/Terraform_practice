# s3.tf
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  lifecycle {
    prevent_destroy = false
  }

  tags = merge(
    {
      Name        = "MyS3Bucket_123"
      Environment = "Dev"
    },
    { for tag in var.extra_tags : tag.key => tag.value }
  )
}

resource "aws_s3_bucket_server_side_encryption_configuration" "my_bucket_sse" {
  bucket = aws_s3_bucket.my_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

resource "aws_s3_bucket_versioning" "my_bucket_versioning" {
  bucket = aws_s3_bucket.my_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}
