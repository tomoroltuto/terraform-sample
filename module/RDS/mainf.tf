#RDSの構築  
resource "aws_db_instance" "tf-db" {
  identifier              = "tf-rds-${var.my_env}"
  allocated_storage       = 20
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t2.micro"
  name                    = "mydb"
  username                = "admin"
  password                = "adminadmin"
  db_subnet_group_name    = "tf-db-sbgp-${var.my_env}"
  vpc_security_group_ids  = [aws_security_group.tf_rds_sq.id]
  publicly_accessible     = "false"
  copy_tags_to_snapshot   = "true"
  backup_retention_period = 7
  tags = {
    Name = "tf-rds-${var.my_env}"
  }
}


#RDSのセキュリティーグループ構築   
resource "aws_security_group" "tf_rds_sq" {
  name        = "tf-rds-sq-${var.my_env}"
  description = "tf-rds-sq-${var.my_env}"
  vpc_id      = var.vpc_id

  ingress {
    description       = "TLS from VPC"
    from_port         = 3306
    to_port           = 3306
    protocol          = "tcp"
    security_groups  = [var.security_group_id]
  }    
  tags = {
    Name = "tf-rds-sq-${var.my_env}"
  }
}

#RDSのサブネットグループ構築 
resource "aws_db_subnet_group" "tf_rds_sbgp" {
  name       = "tf-db-sbgp-${var.my_env}"
  subnet_ids = var.subnet_ids
  
  tags = { 
    Name = "tf-rds-sbgp-${var.my_env}"
  }
}