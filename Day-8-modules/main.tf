resource "aws_instance" "sever" {
  ami           = var.ami
  instance_type = var.instance_type
}
