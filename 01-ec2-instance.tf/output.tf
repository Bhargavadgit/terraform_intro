output "sg-id" {
    value = aws_security_group.manuval_instance.id
}

output "aws_instance" {
    value = aws_instance.manuval_instance
}

output "private_ip" {
    value = aws_instance.manuval_instance.private_ip
}
