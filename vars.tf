variable "aws_region" {
  description = "AWS region where resources will be created"
  default     = "ap-south-1" # Change to your desired AWS region
}

variable "db_subnet_cidr" {
  description = "CIDR block for the RDS subnet group"
  default     = ["10.0.1.0/24", "10.0.2.0/24"] # Adjust as needed
}

