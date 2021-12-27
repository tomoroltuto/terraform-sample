# subnetを構築
resource "aws_subnet" "public1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_public1
  availability_zone = var.az1
  tags = {
    Name = "tf-PubSub1a-${var.my_env}"
  }
}
resource "aws_subnet" "public2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_public2
  availability_zone = var.az2
  tags = {
    Name = "tf-PubSub1c-${var.my_env}"
  }
}
resource "aws_subnet" "private1" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_private1
  availability_zone = var.az1
  tags = {
    Name = "tf-priSub1a-${var.my_env}"
  }
}
resource "aws_subnet" "private2" {
  vpc_id            = var.vpc_id
  cidr_block        = var.cidr_private2
  availability_zone = var.az2
  tags = {
    Name = "tf-priSub1c-${var.my_env}"
  }
}