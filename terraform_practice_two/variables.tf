variable "instance_type" {
  description = "The type of instance to create"
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  default     = "ami-09b0a86a2c84101e1" # Replace with your region-specific AMI ID
}

variable "bucket_name" {
  description = "Name of the S3 bucket"
  default     = "my-unique-s3-bucket-1234567" # Replace with a unique bucket name
}

# Define the key name for the EC2 instance (Ensure this key exists in your AWS account)
variable "key_name" {
  description = "The key pair name for SSH access to EC2 instance"
  default     = "terraform_poc" # The key pair you use in AWS
}

variable "extra_tags" {
  description = "Extra tags for the S3 bucket"
  type = list(object({
    key   = string
    value = string
  }))
  default = [
    { key = "Project", value = "TerraformHandsOn" },
    { key = "Team", value = "DevOps" }
  ]
}

# New variable for VPC ID to be used in Security Group
variable "vpc_id" {
  description = "The VPC ID where the EC2 instance will be created"
  type        = string
}
