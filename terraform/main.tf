terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.69"
    }
  }
}

provider "aws" {
  region = "eu-west-3"
}

variable "aws_access_key" {}
variable "aws_secret_key" {}
