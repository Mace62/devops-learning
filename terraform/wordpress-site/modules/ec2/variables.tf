variable "ami_id" { 
    type = string
    description = "The AMI ID to use for the instance"
}

variable "instance_type" {
    type = string
    description = "The instance type to use for the instance"
}

variable "subnet_id" {
    type = string
    description = "The subnet ID to use for the instance"
}

variable "vpc_id" {
    type = string
    description = "The VPC ID to use for the instance"
}

variable "user_data" {
    type = string
    description = "The user data to use for the instance"
}