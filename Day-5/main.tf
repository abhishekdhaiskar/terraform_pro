# create custom network using terraform

# 1.create vpc 
resource "aws_vpc" "customterraform" {
  cidr_block = "10.0.0.0/16"
  tags = {
    name = "customterraform"
  }
}
# 2.create subnet
resource "aws_subnet" "customterraform" {
  vpc_id     = aws_vpc.customterraform.id
  cidr_block = "10.0.0.0/24"
  tags = {
    name = "mysubnet"
  }

}
# 3.create internet gateway attach vpc
resource "aws_internet_gateway" "customterraform" {
  vpc_id = aws_vpc.customterraform.id
  tags = {
    name = "myigtw"
  }

}
# 4.create a route table adit routes
resource "aws_route_table" "customterraform" {
  vpc_id = aws_vpc.customterraform.id

  route {
    cidr_block = "0.0.0.0/0"  
    gateway_id = aws_internet_gateway.customterraform.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}

# 5.subnet association
resource "aws_route_table_association" "customterraform" {
  subnet_id      = aws_subnet.customterraform.id
  route_table_id = aws_route_table.customterraform.id

}
# 6. create security group
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.customterraform.id

  ingress {
    description = "TLS from VPC"
    from_port   = 22
    to_port     = 100
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "customterraform"
  }
}
# create EC2