# main.tf

provider "aws" {
  region = "ap-south-1"  # Mumbai region
}

resource "aws_instance" "example" {
  ami           = "ami-022ce6f32988af5fa"  # Replace with your preferred AMI ID
  instance_type = "t2.micro"  # Free tier eligible instance type

  tags = {
    Name = "Terraform-Example"
  }

  user_data = <<-EOF
              #!/bin/bash
              sudo yum update -y
              sudo yum install -y httpd
              sudo systemctl start httpd
              sudo systemctl enable httpd
              EOF
}
