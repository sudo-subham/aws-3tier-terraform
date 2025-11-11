variable "region" {
  description = "AWS region"
  default     = "ap-south-1"
}

variable "project" {
  default = "terraform-3tier"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "public_subnets" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "azs" {
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  description = "Existing EC2 Key Pair name"
}

variable "ami_id" {
  description = "AMI ID for EC2 (Amazon Linux 2)"
}

variable "db_username" {
  default = "admin"
}

variable "db_password" {
  description = "Password for RDS"
}

variable "desired_capacity" {
  default = 1
}

variable "max_size" {
  default = 2
}

variable "min_size" {
  default = 1
}
