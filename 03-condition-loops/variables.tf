variable "instance_type" {
  type    = string
  default = "t3.micro"
  validation {
    condition     = contains(["t3.micro", "t3.small", "t3.medium"], var.instance_type)
    error_message = "instance_type falls bewteen t3.micro or t3.small or t3.medium"
  }
}



variable "ami_id" {
  type    = string
  default = "ami-0055977a6e828a4f4"
}

variable "Instances" {
  type    = list(any)
  default = ["mongodb", "redis", "mysql", "rabbitmq", "frontend"]
}

variable "project" {
  default = "roboshop"
}

variable "environment" {
  default = "dev"
}
variable "zone_id" {
  default = "Z07751372GOQ7XKXVY478"
}

variable "domain_name" {
  default = "bhar92s.store"
}