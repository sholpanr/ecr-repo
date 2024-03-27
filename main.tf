terraform {
  backend "s3" {
    bucket = "tf-state-aksholpan-2"
    key    = "my-terraform-project"
    region = "us-east-1"
    # dynamodb_table          = "tf-locks-aksholpan-2"
  }
}

terraform {
  required_version = ">= 1.0.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0, < 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecr_repository" "my_ecr_repo" {
  name                 = "nodejs-app"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}

