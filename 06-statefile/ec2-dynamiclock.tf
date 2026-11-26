resource "aws_instance" "state_demo" {
  ami           = data.aws_ami.bhargava.id
  instance_type = var.instance_type
  vpc_security_group_ids = [
    aws_security_group.roboshop.state_demo.id,
    aws_security_group.common.id
  ]

  tags = {
    Name = "${var.project}-${var.environment}-state_demo"
  }
}

resource "aws_security_group" "common" {
  name        = "${var.project}-${var.environment}-common"
  description = "allow all instance"
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-${var.environment}-common"
  }
}

resource "aws_security_group" "state_demo" {
  name        = "${var.project}-${var.environment}-state_demo"
  description = "allow all instance"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
  
      from_port   = 0
      to_port     = 0
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "${var.project}-${var.environment}-state_demo"
  }
}