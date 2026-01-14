terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.0"
        }
    }
}

provider "aws" {
    access_key = "test"
    secret_key = "test"
    region = "us-east-1"
    skip_credentials_validation = true
    skip_requesting_account_id = true
    endpoints {
        ec2 = "http://localhost:4566"
    }
}


########################################################
# Basic
########################################################

resource "aws_instance" "example" {
    ami = "ami-test"
    instance_type = "t2.micro"
}