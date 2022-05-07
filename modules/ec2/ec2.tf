resource "aws_instance" "myec2" {
  ami = "ami-0f9fc25dd2506cf6d"
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_ip
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  //security_groups = var.security_groups
  for_each = toset(["master", "slave"])
  tags = {
    Name = "${each.key}"
  }

}
