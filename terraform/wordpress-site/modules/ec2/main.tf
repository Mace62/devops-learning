resource "aws_instance" "wordpress" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = var.subnet_id
    vpc_security_group_ids = [aws_security_group.allow_public_http_ingress.id]
    tags = {
        Name = "WordPress"
    }
    user_data = var.user_data
}

resource "aws_security_group" "allow_public_http_ingress" {
    name = "allow-public-http-ingress"
    description = "Allow public HTTP ingress and SSH"
    vpc_id = var.vpc_id
    ingress {
        description = "HTTP"
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}