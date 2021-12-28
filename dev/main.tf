terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  backend "s3" {
    bucket = "tf-segawa"
    key    = "tf-sample/dev/terraform.tfstate"
    region = "ap-northeast-1"
  }
}

module "vpc" {
  source        = "../module/VPC"
  cidr_vpc      = "10.10.0.0/16"
  my_env= "dev"
}

module "subnet" {
  source        = "../module/SUBNET"
  vpc_id        = module.vpc.vpc_id
  cidr_public1  = "10.10.0.0/24"
  cidr_public2  = "10.10.1.0/24"
  cidr_private1 = "10.10.2.0/24"
  cidr_private2 = "10.10.3.0/24"
  az1           = "ap-northeast-1a"
  az2           = "ap-northeast-1c"
  my_env= "dev"
}

module "route" {
  source        = "../module/ROUTE"
  vpc_id        = module.vpc.vpc_id
  subnet_id_1     = module.subnet.public1_id
  subnet_id_2     = module.subnet.public2_id
  gateway_id    = module.vpc.gw_id
  my_env= "dev"
}

module "ec2_instance" {
  source = "../module/EC2"
  ami                    = "ami-0218d08a1f9dac831"
  instance_type          = "t2.micro"
  subnet_id              = module.subnet.public1_id
  vpc_id                 = module.vpc.vpc_id
  security_groups        = [module.security_group.ec2_sg_id]
  my_env= "dev"
}

module "security_group" {
  source                 = "../module/EC2SG"
  vpc_id                 = module.vpc.vpc_id
  sg_config = {
  protocol               = "tcp"
  port                   = [22, 80,3000]
  cidr_blocks            = ["0.0.0.0/0"]
  }
  my_env= "dev"
}

module "rds_instance" {
  source = "../module/RDS"
  vpc_id                 = module.vpc.vpc_id  
  subnet_ids             = [module.subnet.private1_id,module.subnet.private2_id]
  security_group_id      = module.security_group.ec2_sg_id
  my_env                 = "dev"
}
