#ルートテーブル構築
resource "aws_route_table" "rt" {
  vpc_id = var.vpc_id
  tags = {
    Name = "tf-rt-${var.my_env}"
  }
}
#ルートテーブルとパブリックサブネットを関連付ける 
resource "aws_route_table_association" "a" {
  subnet_id = var.subnet_id_1
  route_table_id = aws_route_table.rt.id
}
resource "aws_route_table_association" "c" {
  subnet_id = var.subnet_id_2
  route_table_id = aws_route_table.rt.id
}
#ルート構築
resource "aws_route" "r" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = var.gateway_id
}