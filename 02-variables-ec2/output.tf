output "private_ip" {
    value = aws_instance.mongodb.private_ip
}

output "public_ip" {
    value = aws_instance.mongodb.public_ip
}

output "security_vpc" {
    value = aws_security_group.mongodb.vpc_id 
}

output "Instance_id" {
    value = aws_instance.mongodb.id
}

