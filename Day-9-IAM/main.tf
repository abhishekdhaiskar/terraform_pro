resource "aws_iam_user" "ec2fullacces" {
    name = "ec2"
  
}
resource "aws_iam_user_policy_attachment" "user_policy" {
  user       = aws_iam_user.ec2fullacces.name
  policy_arn = "arn:aws:iam::888577051441:user/ec2user" # Attach EC2 Full Access Policy
}

resource "aws_iam_access_key" "user_key" {
  user = aws_iam_user.ec2fullacces.name
}