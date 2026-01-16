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
# For Each
########################################################

locals {
    instances = {
        dev1 = {
            instance_type = "t2.micro"
            ami_id = "ami-dev1"
        }
        dev2 = {
            instance_type = "t3.micro"
            ami_id = "ami-dev2"
        }
        dev3 = {
            instance_type = "t3.micro"
            ami_id = "ami-dev3"
        }
    }
}

resource "aws_instance" "this" {
    for_each = local.instances

    instance_type = each.value.instance_type
    ami = each.value.ami_id

    tags = {
        Name = each.key
    }
}