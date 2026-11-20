resource "aws_instance" "mongodb"{

 ami = var.ami_id
 instance_type = var.instance_type
 vpc_security_group_ids = [ aws_security_group.mongodb.id ]
 
 tags =merge(
  var.ec2_tags,
    {
     Name = "var.Instance_name"
    }
 )
}

resource "aws_security_group" "mongodb"{
  name = "mongodb"
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
    Name = "roboshop-${var.Instance_name}"
  }
}