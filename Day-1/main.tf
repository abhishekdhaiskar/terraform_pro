resource "aws_instance" "name" {
    ami = "ami-0c02fb55956c7d316"  # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "MyTerraformEC2"
  }
}