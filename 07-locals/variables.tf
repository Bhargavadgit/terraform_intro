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

