inputs = {
    cidr_block = "10.0.0.0/16"
    vpc_name = "dev-vpc"
}

terraform {
    source = "../../../modules/vpc"
}

include {
    path = find_in_parent_folders()
}

generate "provider" { 
    path = "provider.tf"
    if_exists = "overwrite"
    contents = <<EOF
provider "aws" {
    region = "us-east-1"
    access_key = "test"
    secret_key = "test"
#   s3_force_path_style = true
    skip_credentials_validation = true
    skip_metadata_api_check = true
    skip_requesting_account_id = true

    endpoints {
        ec2 = "http://localhost:4566"
    }
}
EOF
}