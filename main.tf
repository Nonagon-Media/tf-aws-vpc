provider "aws" {
	region = "${var.aws_region}"
}

# An S3 bucket to hold the state file
resource "aws_s3_bucket" "myn9ntfstatebucket" {
  bucket = "n9n.tfstate"
  acl    = "private"

  # We want to have versioning enabled, because it allows us to keep track of
  # the Terraform state history
  versioning {
    enabled = true
  }

  # We also want to make sure our bucket enables server-side encryption
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }

  tags = {
    Name = "N9N TF State"
  }
}

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
#resource "aws_instance" "web" {
#	ami = "${var.default_ami}"
#	instance_type = "t1.micro"
#	tags = {
#		Name = "N9N Test Instance"
#	}
#}
