provider "aws" {
  region = "ap-south-1"
}

module "my_vpc" {
  source      = "../module/vpc"
  vpc_cidr    = "192.168.0.0/16"
  tenancy     = "default"
  vpc_id      = "${module.my_vpc.vpc_id}"
  subnet_cidr = "192.168.1.0/24"
}

module "my_ec2" {
  source        = "../module/ec2"
  ec2_count     = 1
  ami_id        = "ami-0009e88f05cf1087c"
  instance_type = "t2.micro"
  subnet_id     = "${module.my_vpc.subnet_id}"