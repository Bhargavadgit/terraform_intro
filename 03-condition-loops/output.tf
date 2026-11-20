output "mongodb" {
  value = aws_instance.roboshop[0].private_ip
}
output "redis" {
  value = aws_instance.roboshop[1].private_ip
}
output "mysql" {
  value = aws_instance.roboshop[2].private_ip
}
output "rabbitmq" {
  value = aws_instance.roboshop[3].private_ip
}
#output "public_ip" {
#  value = aws_instance.roboshop[0].public_ip
#}

#output "Instance_name" {
#  value = "aws_instance.roboshop[*].tags.Name"
#}
