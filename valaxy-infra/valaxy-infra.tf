module "myprovider"  {
   source = "../modules/aws-provider"
}

module "vpc-module" {
  source = "../modules/vpc"
  subnet_id = module.my-subnet.public-subnet
}

module "my-subnet" {
  source = "../modules/subnet"
  vpc_id = module.vpc-module.vpc_id
}
module "security-group" {
   source = "../modules/security-group"
   vpc_id = module.vpc-module.vpc_id
}

output "security_group_id" {
   value = "${module.security-group.security_group_public}"
}

module "ec2module" {
  source = "../modules/ec2"
  vpc_security_group_ids = ["${module.security-group.security_group_public}"]
  subnet_id = module.my-subnet.public-subnet
}




