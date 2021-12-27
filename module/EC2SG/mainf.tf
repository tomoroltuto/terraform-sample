#EC2のセキュリティーグループ構築   
resource "aws_security_group" "tf_ec2_sq" {
  name        = "tf-ec2-sq-${var.my_env}"
  vpc_id      = var.vpc_id
  dynamic "ingress" {
    for_each = var.sg_config.port

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = var.sg_config.protocol
      cidr_blocks = var.sg_config.cidr_blocks
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "tf-ec2-sq-${var.my_env}"
  }
}
