output "instance_id" {
    value = module.ec2.instance_id
    description = "The ID of the instance"
}

output "instance_public_ip" {
    value = module.ec2.instance_public_ip
    description = "The public IP of the instance"
}

output "vpc_id" {
    value = module.vpc.vpc_id
    description = "The ID of the VPC"
}

output "subnet_id" {
    value = module.vpc.subnet_id
    description = "The ID of the subnet"
}

