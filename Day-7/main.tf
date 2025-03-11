# count method for multiple server create

resource "aws_instance" "example" {
  count         = 3  # Number of EC2 instances to create
  ami           = "ami-0013d898808600c4a" # Replace with a valid AMI ID
  instance_type = "t2.micro"

  tags = {
    Name = "MyEC2-${count.index}" #generates instance names like MyEC2-0, MyEC2-1, MyEC2-2
  }
}

# Using for_each to Create Multiple EC2 Instances with Different Names

# provider "aws" {
#   region = "us-east-1"
# }

# variable "instances" {
#   type    = map(any)
#   default = {
#     "web"    = "t2.micro"
#     "app"    = "t2.small"
#     "db"     = "t3.micro"
#   }
# }

# resource "aws_instance" "example" {
#   for_each      = var.instances
#   ami           = "ami-0c55b159cbfafe1f0"
#   instance_type = each.value

#   tags = {
#     Name = each.key
#   }
# }

