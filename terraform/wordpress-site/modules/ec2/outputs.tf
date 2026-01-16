output "instance_id" {
    value = aws_instance.wordpress.id
    description = "The ID of the instance"
}

output "instance_public_ip" {
    value = aws_instance.wordpress.public_ip
    description = "The public IP of the instance"
}