variable "instance_type" {
  default = "t2.micro"
}

variable "associate_ip" {
   default = true
}

variable "ami" {
  default =  "ami-08c40ec9ead489470"
}
variable "key_name" {
   default = "rtp-devops"
}

variable "security_groups" {
  default = ["valaxy-sg-rtp"]
}

variable "vpc_security_group_ids" {
  default = ["valaxy-sg-rtp"]
}

variable "subnet_id" {
  type = string
}