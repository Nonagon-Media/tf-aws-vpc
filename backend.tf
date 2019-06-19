# The TF backend will be held in a dynamo table in S3
resource "aws_dynamodb_table" "tfstatedynamotable" {
  name            = "n9n.tfstate"
  hash_key        = "LockID"
  read_capacity   = 5
  write_capacity  = 5

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name = "Terraform state consistency"
  }
}

# Persist the system state in S3
terraform {
  backend "s3" {
    bucket          = "n9n.tfstate"
    key             = "terraform.state"
    region          = "us-west-2"
    encrypt         = true
    dynamodb_table  = "n9n.tfstate"
  }
}