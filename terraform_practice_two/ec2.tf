resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type

  # Attach security group to the instance
  vpc_security_group_ids = [aws_security_group.web_sg.id]

  tags = {
    Name = "MyEC2Instance"
  }

  key_name = "terraform_poc"  # Make sure this key pair exists in AWS

  # Provisioners
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ubuntu"
      host     = self.public_ip
      timeout  = "5m"  # Increased timeout
    }

    inline = [
      "sleep 60",  # Wait for 60 seconds to ensure instance is fully up
      "sudo apt update -y",
      "sudo apt install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2"
    ]
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > ec2_public_ip.txt"
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Security Group to allow SSH and HTTP access
resource "aws_security_group" "web_sg" {
  name        = "web_security_group"
  description = "Allow SSH and HTTP access"
  vpc_id      = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow access from any IP
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Allow access from any IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "WebSG"
  }
}
