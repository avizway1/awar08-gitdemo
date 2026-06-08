terraform {
  backend "s3" {
    bucket       = "aviz-terraform-statedemo"
    key          = "ec2proj/terraform.tfstate"
    region       = "ap-south-1"
    use_lockfile = true
  }
}

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.49"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}



resource "aws_instance" "webserver" {
  ami                    = "ami-0685bcc683dadb6b9"
  instance_type          = "t3.small"
  vpc_security_group_ids = ["sg-07d86ad636f3c4d7f"]
  key_name               = "awar08-kp"

  tags = {
    "Name" = "web-server-backend-test"
    "os"   = "Linux"
  }
}