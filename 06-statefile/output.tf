output "ami_id" {
    value = data.aws_ami.bhargava.id
}

output "Instance_name" {
    value = aws_instance.roboshop[*].tags.name
}

output "Instance_id" {
    value = aws_instance.roboshop[*].id
}