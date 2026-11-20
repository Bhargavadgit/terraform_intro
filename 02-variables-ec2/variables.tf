variable "instance_type"{
  type = string
  default = "t3.micro"   
  validation {
   condition = contains(["t3.micro","t3.small","t3.medium"],var.instance_type)
   error_message = "instance_type falls bewteen t3.micro or t3.small or t3.medium" 
  }
}



variable "ami_id"{
  type = string
  default = "ami-0055977a6e828a4f4"   
}

variable "Instance_name"{
  type = string
  default = "mongodb"   
}

variable "ec2_tags"{
  type = map 
  default = {
    project = "Roboshop"
    environment = "dev"
    terraform = true   
  }
}

