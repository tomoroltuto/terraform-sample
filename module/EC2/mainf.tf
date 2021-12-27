#EC2構築
resource "aws_instance" "tf-ec2" {
  ami                 = var.ami
  instance_type       = var.instance_type
  security_groups     = var.security_groups
  subnet_id           = var.subnet_id
  tags = {
    Name = "tf-ec2-${var.my_env}"
  }
}
