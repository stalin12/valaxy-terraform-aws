variable "instance_type" {
  default = "t2.micro"
}

variable "associate_ip" {
   default = true
}

variable "ami" {
  default =  "ami-0f9fc25dd2506cf6d"
}
variable "key_name" {
   default = "Stalin-Devops"
}

variable "security_groups" {
  default = ["valaxy-sg-rtp"]
}

variable "vpc_security_group_ids" {
  default = ["valaxy-sg-rtp"]
}