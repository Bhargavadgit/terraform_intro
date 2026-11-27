/***************************************
local acts like as a variables but the advantages are listed below
    1 - we can use variables inside locals
    2 - we can use locals inside locals
    3 - we can't over right locals
in variable.tf files we gave t3.micro but terraform consider t3.small    
******************************************/
locals {
  instance_type = "t3.small"
}