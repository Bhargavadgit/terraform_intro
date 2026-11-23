variable "Instances" {
  type = map(any)
  default = {
    mongodb = {
      instance_type = "t3.micro"
      port_no       = 27017
    },
    redis = {
      instance_type = "t3.micro"
      port_no       = 6379
    },
    mysql = {
      instance_type = "t3.micro"
      port_no       = 3306
    },
    rabbitmq = {
      instance_type = "t3.micro"
      port_no       = 5672
    },
    catalogue = {
      instance_type = "t3.micro"
      port_no       = 8080
    },
    user = {
      instance_type = "t3.micro"
      port_no       = 8080
    },
    cart = {
      instance_type = "t3.micro"
      port_no       = 8080
    },
    shipping = {
      instance_type = "t3.micro"
      port_no       = 8080
    },
    payment = {
      instance_type = "t3.micro"
      port_no       = 8080
    },
    frontend = {
      instance_type = "t3.micro"
      port_no       = 80
    }
  }
}

variable "project" {
  type    = string
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

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "Instance type of EC2"

  validation {
    # Returns true if var.enviroinstance_typenment is one of the items in the list
    condition     = contains(["t3.micro", "t3.small", "t3.medium", "t3.large"], var.instance_type)
    error_message = "Instance type must be one of t3.small, t3.micro, t3.medium or t3.large."
  }
}

variable "ingress_rules" {
  default = {
    ssh = {
      port        = 22
      cidr_blocks = ["0.0.0.0/0"]
      description = "Opening port 22 from all IP for SSH access"
    }
    mongodb = {
      port        = 27017
      cidr_blocks = ["0.0.0.0/0"]
      description = "Opening port 27017 from mongodb access"
    }
    redis = {
      port        = 6379
      cidr_blocks = ["0.0.0.0/0"]
      description = "Opening port 27017 from mongodb access"
    }
    mysql = {
      port        = 3306
      cidr_blocks = ["0.0.0.0/0"]
      description = "Opening port 27017 from mongodb access"
    }
    http = {
      port        = 80
      cidr_blocks = ["0.0.0.0/0"]
      description = "Opening port 80 from all IP for web access"
    }
    tcp = {
      port        = 8080
      cidr_blocks = ["0.0.0.0/0"]
      description = "Opening port 8081 from all IP for custom protocol access"
    }
    rabbitmq = {
      port        = 5671
      cidr_blocks = ["0.0.0.0/0"]
      description = "Opening port 8081 from all IP for custom protocol access"
    }
  }
}