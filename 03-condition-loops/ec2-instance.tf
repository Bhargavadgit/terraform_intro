resource "aws_instance" "roboshop" {
  count         = length(var.Instances)
  ami           = var.ami_id
  instance_type = var.environment == "dev" ? var.instance_type : "t3.medium"
  vpc_security_group_ids = [
    aws_security_group.common.id,
    aws_security_group.roboshop[count.index].id
  ]
  tags = {
    Name = "${var.project}-${var.environment}-${var.Instances[count.index]}"
  }
}

resource "aws_security_group" "common" {
  name        = "${var.project}-${var.environment}-common"
  description = "allow all servers"
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}-common"
  }
}

resource "aws_security_group" "roboshop" {
  count       = length(var.Instances)
  name        = "${var.project}-${var.environment}-${var.Instances[count.index]}"
  description = "allow all servers"
  ingress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}-${var.Instances[count.index]}"
  }
}

resource "aws_route53_record" "roboshop" {
  count = length(var.Instances)  
  zone_id = var.zone_id
  name    = "${var.Instances[count.index]}.${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [ aws_instance.roboshop[count.index].private_ip ]
  allow_overwrite = true
}

resource "aws_route53_record" "frontend" {
  count = contains(var.Instances, "frontend") ? 1 : 0
  zone_id = var.zone_id
  name    = "${var.domain_name}"
  type    = "A"
  ttl     = 1
  records = [ aws_instance.roboshop[index(var.Instances, "frontend")].public_ip ]
  allow_overwrite = true
}
