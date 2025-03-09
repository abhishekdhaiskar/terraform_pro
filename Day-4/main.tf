
  # this is backend configuration instruct terraform to store its state file
terraform {
  backend "s3" {
     bucket         = "abhishekdevopsengineer"
    key            = "Day-3/terraform.tfstate"
    region         = "ap-southeast-2"
    encrypt        = true
    #dynamodb_table = "terraform-locks"  # Enables state locking
    
  }
}