# リソース定義
# ----------
# VPCを構築
resource "aws_vpc" "vpc" {
  cidr_block           = var.cidr_vpc
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  tags = {
    Name = "tf-vpc-${var.my_env}"
  }
}

#インターネットゲートウェイ構築 
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "tf-gw-${var.my_env}"
  }
}

