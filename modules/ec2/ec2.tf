resource "aws_instance" "myec2" {
  ami = "ami-08c40ec9ead489470"
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_ip
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id
  //security_groups = var.security_groups
  for_each = toset(["master", "slave"])
  tags = {
    Name = "${each.key}"
  }

}
