provider "aws" {
  region = "af-south-1"
}

data "aws_availability_zones" "available" {
  state = "available"
  filter {
    name="region"
    values = [ "af-south-1" ]
  }
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id            = var.vpc_id
  cidr_block        = "10.0.1.0/24"
  availability_zone = data.aws_availability_zones.available.names[0]

  tags = {
    "Name" = "private-subnet-1"
  }
}

resource "aws_subnet" "private_subnet_2" {
  vpc_id            =  var.vpc_id
  cidr_block        = "10.0.2.0/24"
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    "Name" = "private-subnet-2"
  }
}

module "rds_subnet_group" {
  source  = "terraform-aws-modules/rds/aws"
  version = "6.8.0"

  name        = "sgt-demo-subnetgroup"
  subnet_ids = module.vpc.private_subnets
}