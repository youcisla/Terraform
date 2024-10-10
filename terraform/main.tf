provider "aws" {
  region = "eu-west-3"
}

variable "aws_access_key" {
  description = "AWS Access Key"
  type        = string
}

variable "aws_secret_key" {
  description = "AWS Secret Key"
  type        = string
}

resource "aws_key_pair" "deploy_key" {
  key_name   = "deploy_idrsa"
  public_key = file("../deploy_idrsa.pub")
}

resource "aws_security_group" "allow_all" {
  vpc_id      = aws_vpc.my_vpc.id
  name        = "allow_all_traffic"
  description = "Allow all inbound and outbound traffic"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
