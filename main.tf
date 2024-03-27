terraform {
  backend "s3" {
    bucket = "tf-state-aksholpan-2"
    key    = "my-terraform-project"
    region = "us-east-1"
    # dynamodb_table          = "tf-locks-aksholpan-2"
    # shared_credentials_file = "~/.aws/credentials"
  }
}
# resource "aws_s3_bucket" "terraform_state" {
#   bucket = "tf-state-aksholpan-2"
#   # Enable versioning so we can see the full revision history of our
#   # state files
#   versioning {
#     enabled = true
#   }
#   server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }
# }

# resource "aws_dynamodb_table" "terraform_locks" {
#   name         = "tf-locks-aksholpan-2"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#     }
# }
terraform {
  required_version = ">= 0.14"
  
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  # access_key = var.AWS_ACCESS_KEY_ID
  # secret_key = var.AWS_SECRET_ACCESS_KEY
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = "nodejs-app"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

