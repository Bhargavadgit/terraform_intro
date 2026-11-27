resource "aws_instance" "provisioner-demo" {
  ami           = data.aws_ami.bhargava.id
  instance_type = local.instance_type
  vpc_security_group_ids = [
    aws_security_group.provisioner-demo.id,
    aws_security_group.common.id
  ]

  provisioner "local-exec" {
    command = "echo Created ${self.public_ip}  > inventory.ini"
  }  

  provisioner "local-exec" {
    command = "echo instance Created"
  }  

  provisioner "local-exec" {
    when = destroy
    command = "echo instance destroed"
  }  

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"
    host        = self.public_ip
  }

  /* provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "sudo systemctl restart nginx"
    ]
  }   */

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
     "chmod +x /tmp/bootstrap.sh",
     "sudo sh /tmp/bootstrap.sh"
    ] 
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]  
  }
  tags = {
    Name = "${var.project}-${var.environment}-provisioner-demo"
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

resource "aws_security_group" "provisioner-demo" {
  name        = "${var.project}-${var.environment}-provisioner-demo"
  description = "allow all instance"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  tags = {
    Name = "${var.project}-${var.environment}-provisioner-demo"
  }
}  
