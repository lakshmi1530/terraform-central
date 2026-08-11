# Latest Amazon Linux 2023 AMI
data "aws_ssm_parameter" "amazon_linux" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}


# Existing Security Group
data "aws_security_group" "jenkins" {
  name = var.security_group_name
}


# Create Jenkins EC2
resource "aws_instance" "jenkins" {

  ami = data.aws_ssm_parameter.amazon_linux.value

  instance_type = var.instance_type

  key_name = var.key_name

  vpc_security_group_ids = [
    data.aws_security_group.jenkins.id
  ]

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

  tags = {
    Name        = var.instance_name
    Environment = "learning"
    ManagedBy   = "Terraform"
  }
}