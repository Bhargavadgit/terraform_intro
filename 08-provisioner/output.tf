output "ami_id" {
  value = data.aws_ami.bhargava.id
}

output "Instance_name" {
  value = aws_instance.provisioner-demo.tags.Name
}

output "Instance_id" {
  value = aws_instance.provisioner-demo.id
}