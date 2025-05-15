resource "aws_instance" "name" {
    ami = "ami-04999cd8f2624f834"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "MyTerraformEC2"
  }
}
