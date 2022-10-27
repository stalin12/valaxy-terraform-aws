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
module "ec2module" {
  source = "../modules/ec2"
  vpc_security_group_ids = ["${module.security-group.security_group_public}"]
  subnet_id = module.my-subnet.public-subnet
}


output "jenkins_master_public_ip" {
   description = "The Public IP assigned to the Jenkins master instance"
   value = "${module.ec2module.master_public_ip}"
}

output "jenkins_slave_public_ip" {
   description = "The Public IP assigned to the Jenkins slave instance"
   value = "${module.ec2module.slave_public_ip}"
}

module "k8scluster" {
  source = "../modules/ec2"
  vpc_security_group_ids = ["${module.security-group.security_group_public}"]
  subnet_id = module.my-subnet.public-subnet
  instance_type = "t2.medium"
  ami = "ami-0149b2da6ceec4bb0"
}

output "k8s_master_public_ip" {
   description = "The Public IP assigned to the K8s master instance"
   value = "${module.k8scluster.master_public_ip}"
}

output "k8s_slave_public_ip" {
   description = "The Public IP assigned to the k8s slave instance"
   value = "${module.k8scluster.slave_public_ip}"
}

output "security_group_id" {
   value = "${module.security-group.security_group_public}"
}

output "vpc_id" {
  value = "${module.vpc-module.vpc_id}"
}

output "subnet_id" {
  value = "${module.my-subnet.public-subnet}"
}



