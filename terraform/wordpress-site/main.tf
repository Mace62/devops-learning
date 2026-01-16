module "vpc" {
    source = "./modules/vpc"
}

module "ec2" {
    source = "./modules/ec2"
    vpc_id = module.vpc.vpc_id
    subnet_id = module.vpc.subnet_id
    ami_id = var.ami_id
    instance_type = var.instance_type
    user_data = file("scripts/user_data.sh")
}