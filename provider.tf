terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.54"
    }
  }

  required_version = ">= 1.4.0"
}

provider "aws" {
  region     = "eu-north-1" # which location → AWS region (e.g., ap-south-1)
  access_key = "AKIAXXXXXXXXXXXXXXX" #your access key
  secret_key = "2TE/bXXXXXXXXXXXXXXXXXXXXXXXXXXXX"   #your secret key
 }
