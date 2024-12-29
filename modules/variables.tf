variable "ami_id" {
  description = "The AMI ID for the EC2 instance."
  default     = "ami-09b0a86a2c84101e1"
}

variable "instance_type" {
  description = "The type of EC2 instance to create."
  default     = "t2.micro"
}

variable "key_name" {
  description = "The key pair name for SSH access."
  default     = "terraform_poc"
}

variable "vpc_id" {
  description = "The VPC ID where resources will be created."
  type        = string
}

variable "common_tags" {
  description = "Common tags to apply to all resources."
  default     = {
    Project = "TerraformProject"
    Owner   = "Terraform"
  }
}
