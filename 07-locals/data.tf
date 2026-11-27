/***********************************
get ami_id through Data source because ami_id might change so its better to get it from datafileusing below Query
************************************/

data "aws_ami" "bhargava" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

