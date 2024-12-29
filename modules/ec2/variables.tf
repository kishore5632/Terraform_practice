variable "ami_id" {
  description = "The AMI ID to use for the EC2 instance."
  type        = string
}

variable "instance_type" {
  description = "The type of EC2 instance to create."
  type        = string
}

variable "key_name" {
  description = "The key pair name to use for SSH access."
  type        = string
}

variable "security_group_ids" {
  description = "List of security group IDs to associate with the instance."
  type        = list(string)
}

variable "tags" {
  description = "Additional tags to apply to the instance."
  type        = map(string)
}

variable "instance_name" {
  description = "Name of the EC2 instance."
  type        = string
}
