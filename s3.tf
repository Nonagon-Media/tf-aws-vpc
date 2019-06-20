##################
### S3 BUCKETS ###
##################

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