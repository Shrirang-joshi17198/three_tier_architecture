provider "aws" {
  alias = "vpc"
  region = "ap-south-1"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = var.db_subnet_cidr[0]
  availability_zone       = "ap-south-1a" # Change to your desired AZ
  map_public_ip_on_launch = true
}

resource "aws_subnet" "private_subnet" {
  vpc_id          = aws_vpc.my_vpc.id
  cidr_block      = var.db_subnet_cidr[1]
  availability_zone = "ap-south-1b" # Change to your desired AZ
}

resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  description = "RDS security group"
  vpc_id      = aws_vpc.my_vpc.id
}

