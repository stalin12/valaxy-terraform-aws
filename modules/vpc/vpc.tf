resource "aws_vpc" "prod-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "prod-vpc"
  }
}

resource "aws_internet_gateway" mygateway {
  vpc_id = aws_vpc.prod-vpc.id
}

resource "aws_route_table" "my_table" {
  vpc_id = aws_vpc.prod-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.mygateway.id
  }
}

resource "aws_route_table_association" "rta_subnet_public" {
   subnet_id = var.subnet_id
   route_table_id = aws_route_table.my_table.id
}
