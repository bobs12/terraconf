provider "aws" {
  region = "eu-central-1"
}


module "ec2" {
  source = "../modules/modules_ec2"
  security_groups = [module.sequrity_group.security_groups_id]
  subnet_id = module.vpc.public_subnet_id
}

module "vpc" {
  source = "../modules/modules_vpc"
  
}

module "sequrity_group" {
  source = "../modules/modules_sequrity_groups"
  vpc_id = module.vpc.vpc_id
}

