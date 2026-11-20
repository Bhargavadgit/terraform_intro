resource "aws_instance" "roboshop" {
    for_each = var.Instances
    ami = var.ami_id
    instance_type = var.instance_type
    vpc_security_group_ids = [
        aws_security_group.roboshop[each.key].id,
        aws_security_group.common.id
    ]

    tags ={
        Name = "${var.project}-${var.environment}-${each.key}"
    }
}

resource "aws_security_group" "common" {
    name = "${var.project}-${var.environment}-common"
    description = "allow all instance"
    egress{
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags ={
        Name = "${var.project}-${var.environment}-common"   
    }
}

resource "aws_security_group" "roboshop" {
    for_each = var.Instances
    name = "${var.project}-${var.environment}-${each.key}"
    description = "allow all instance"
    egress{
        from_port   = 0
        to_port     = 0
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress{
        from_port   = each.value.port_no
        to_port     = each.value.port_no
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }    
    tags ={
        Name = "${var.project}-${var.environment}-${each.key}"   
    }
}