# variables declarations that are passed in to the component module go here
# supply the actual values in terraform.tfvars within the environment folder
variable "vpc_cidr" { }
variable "vpc_name" { }
variable "azs" { type = "list" }
variable "private_subnets" { type = "list" }
variable "public_subnets" { type = "list" }
variable "environment_name" { }