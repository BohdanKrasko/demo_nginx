terraform {
  backend "s3" {
    bucket         = "krasko-tr"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    dynamodb_table = "terraform-state-lock-dynamo"
  }

  required_providers {
    aws = {
      sourse  = "hashicorp/aws"
      version = "~> 3.23.0"
    }
  }
}

provider "aws" {
  region                  = "eu-west-2"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}
