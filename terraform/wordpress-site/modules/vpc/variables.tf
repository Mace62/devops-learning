variable "vpc_cidr" {
    type = string
    description = "CIDR block for the VPC"
    default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
    type = string
    description = "CIDR block for the public subnet"
    default = "10.0.1.0/24"
}

variable "default_route_cidr" {
    type = string
    description = "CIDR block for the default route (usually 0.0.0.0/0)"
    default = "0.0.0.0/0"
}
