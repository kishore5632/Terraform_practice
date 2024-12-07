# s3.tf
resource "aws_s3_bucket" "my_bucket" {
  bucket = var.bucket_name

  acl    = "private"

  tags = {
    Name        = "MyS3Bucket"
    Environment = "Dev"
  }
}
