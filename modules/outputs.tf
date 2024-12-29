output "ec2_instance_id" {
  description = "The ID of the EC2 instance."
  value       = module.ec2_instance.instance_id
}

output "ec2_instance_public_ip" {
  description = "The public IP address of the EC2 instance."
  value       = module.ec2_instance.public_ip
}

output "security_group_id" {
  description = "The ID of the security group."
  value       = aws_security_group.web_sg.id
}
