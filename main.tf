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

