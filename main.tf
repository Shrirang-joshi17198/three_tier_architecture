provider "aws" {
  alias  = "main"
  region = var.aws_region
}

module "three_tier_architecture" {
  source  = "./my_vpc"
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

module "my_rds" {
  source = "./my_rds"

  # Pass the required variables
  db_instance_identifier    = "mydbinstance"
  db_engine                 = "mysql"
  db_engine_version         = "5.7"
  db_instance_class         = "db.t2.micro"
  db_allocated_storage      = 20
  db_username               = "myuser"
  db_password               = "mypassword"
  db_publicly_accessible    = true

  # Specify skip_final_snapshot for the destruction phase
  skip_final_snapshot       = true
}

resource "aws_instance" "public_ec2" {
  ami           = "ami-0287a05f0ef0e9d9a"
  instance_type = "t2.micro"
  # other configuration options
}

resource "aws_instance" "private_ec2" {
  ami           = "ami-0287a05f0ef0e9d9a"
  instance_type = "t2.micro"
  # other configuration options
}
