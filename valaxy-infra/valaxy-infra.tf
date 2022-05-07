module "myprovider"  {
   source = "../modules/aws-provider"
}
module "security-group" {
   source = "../modules/security-group"
}
output "security_group_id" {
   value = "${module.security-group.security_group_public}"
}

module "ec2module" {
  source = "../modules/ec2"
  vpc_security_group_ids = ["${module.security-group.security_group_public}"]
}


