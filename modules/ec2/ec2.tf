resource "aws_instance" "myec2" {
  ami = var.ami
  instance_type = var.instance_type
  associate_public_ip_address = var.associate_ip
  key_name = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id
  for_each = toset(["master", "slave"])
  tags = {
    Name = "${each.key}"
  }

}
