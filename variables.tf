# variables.tf
variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-053b12d3152c0cc71" # Replace with your region-specific AMI ID
}

variable "bucket_name" {
  default = "my-unique-s3-bucket-1234567" # Replace with a unique bucket name
}
