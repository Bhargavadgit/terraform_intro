resource "aws_instance" "manuval_instance"{
 ami = "ami-0055977a6e828a4f4"
 instance_type = "t3.micro"
 vpc_security_group_ids = [aws_security_group.manuval_instance.id]

 tags = { 
 Name = "roboshop-manuval_instance"}
 }

resource "aws_security_group" "manuval_instance"{

 name  = "manuval_instance"
 description = "allow all"
 ingress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-manuval_instance"
  }
}