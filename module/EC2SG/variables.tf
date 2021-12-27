variable "my_env" {}
variable "vpc_id" {}
variable "sg_config" {
  type = object({
    protocol    = string
    port        = list(number)
    cidr_blocks = list(string)
  })
}