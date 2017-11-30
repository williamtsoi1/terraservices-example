# Supply values for your environment-specific variables here
environment_name = "staging"
aws_region       = "ap-southeast-2"
vpc_cidr         = "10.0.0.0/16"
vpc_name         = "my staging VPC"
azs              = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
private_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
public_subnets   = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]