resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "Main VPC"
    }
}

resource "aws_subnet" "public" {
    vpc_id = aws_vpc.main.id
    cidr_block = var.public_subnet_cidr
    map_public_ip_on_launch = true
    tags = {
        Name = "Public Subnet"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = aws_vpc.main.id
    tags = {
        Name = "Internet Gateway"
    }
}

resource "aws_route_table" "public" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = var.default_route_cidr
        gateway_id = aws_internet_gateway.gw.id
    }

    tags = {
        Name = "Public Route Table"
    }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}
