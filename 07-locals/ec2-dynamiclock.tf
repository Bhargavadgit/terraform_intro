resource "aws_instance" "locals-demo" {
  ami           = data.aws_ami.bhargava.id
  instance_type = local.instance_type
  vpc_security_group_ids = [
    aws_security_group.locals-demo.id,
    aws_security_group.common.id
  ]

  tags = {
    Name = "${var.project}-${var.environment}-locals-demo"
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

resource "aws_security_group" "locals-demo" {
  name        = "${var.project}-${var.environment}-locals-demo"
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
    Name = "${var.project}-${var.environment}-locals-demo"
  }
}  
