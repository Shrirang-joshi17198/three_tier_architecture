provider "aws" {
  alias  = "main"
  region = var.aws_region
}

module "vpc" {
  source  = "./vpc"
  providers = {
    aws = aws.main
  }
  # Other configuration for the vpc module
}

module "webapp" {
  source  = "./webapp"
  providers = {
    aws = aws.main
  }
  # Other configuration for the webapp module
}

