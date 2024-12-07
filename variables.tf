# variables.tf
variable "instance_type" {
  default = "t2.micro"
}

variable "ami_id" {
  default = "ami-0c02fb55956c7d316" # Replace with your region-specific AMI ID
}

variable "bucket_name" {
  default = "my-unique-s3-bucket-12345" # Replace with a unique bucket name
}
