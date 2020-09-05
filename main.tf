provider "aws" {
  version = "~> 2.1"
  region = "us-east-1"
}

terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "develop-terraform-backend-s3-store"
    key    = "develop/ci-cd-k8/terraform.tfstate"
    region = "us-east-1"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-dynamodb-iam-locks"
    encrypt        = true
  }
}

data "aws_caller_identity" "current" {}