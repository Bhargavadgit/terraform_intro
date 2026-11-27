/***************************************
local acts like as a variables but the advantages are listed below
    1 - we can use variables inside locals
    2 - we can use locals inside locals
    3 - we can't over right locals
    4 - we can use functions also here
    5 - we can assign functions or expressions to the locals and reused when ever we need
in variable.tf files we gave t3.micro but terraform consider t3.small    
******************************************/
locals {
  instance_type = "t3.small"
  Name = "${var.project}-${var.environment}"
  common_tags = {
    project = var.project
    environment = var.environment
    terraform = true
  }
  ec2_tags = merge(
    local.common_tags,
    {
        Name = "${local.Name}-local-demo" # name = roboshop-dev-local.demo
    }
  )
}