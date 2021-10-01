terraform {
  required_version = ">= 0.12"
  backend "s3" {
    bucket = "963767040018-terraform-s3-backend"
    key    = "state/terraform.tfstate"
    region = "us-east-2"

    dynamodb_table = "terraform_state_lock"
    encrypt        = true
  }
}

provider "aws" {
  region                  = var.aws_region
  profile                 = "terraform"
  shared_credentials_file = "/~/.aws/credentials"
}