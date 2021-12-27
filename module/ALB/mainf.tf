#ALBのセキュリティーグループ構築   
resource "aws_security_group" "tf_alb_sq" {
  name        = "tf_alb_sq"
  description = "tf_alb_sq"
  vpc_id      = var.vpc_id

  ingress {
    description = "TLS from VPC"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "tf_alb_sq-${var.my_env}"
  }
}
#ALBターゲットグループ構築 
resource "aws_alb_target_group" "alb" {
  name                             = "tf-alb-tgp"
  vpc_id                           = var.vpc_id
  port                             = 80
  protocol_version                 = "HTTP1"
  protocol                          = "HTTP"
  
  health_check {
    interval                         = 30
    port                             = 80
    protocol                         = "HTTP"
    timeout                          = 5
    healthy_threshold                = 5
    unhealthy_threshold              = 5
    matcher                          = 200
  }    
  tags = {
    Name = "tf-alb-tgp-${var.my_env}"
  }
}

resource "aws_alb_target_group_attachment" "alb" {
  target_group_arn = aws_alb_target_group.alb.arn
  target_id        = var.target_id
}

#ALB構築
resource "aws_alb" "alb" {
  name               = "tf-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.tf_alb_sq.id]
  subnets          = var.subnet_ids
  enable_deletion_protection = true

  tags = {
    Environment = "production"
    Name        = "tf_alb-${var.my_env}"
  }
}
#ALBリスナー
resource "aws_alb_listener" "alb" {
  load_balancer_arn = aws_alb.alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_alb_target_group.alb.arn
    type             = "forward"
  }
}