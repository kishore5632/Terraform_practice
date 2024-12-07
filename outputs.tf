# outputs.tf
output "ec2_instance_id" {
  value = aws_instance.web_server.id
}

output "s3_bucket_name" {
  value = aws_s3_bucket.my_bucket.bucket
}
