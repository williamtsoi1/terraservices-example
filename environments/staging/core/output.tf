# Put output variables that are dependencies for other modules here
# VPC
output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${module.core.vpc_id}"
}

# Subnets
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = ["${module.core.private_subnets}"]
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = ["${module.core.public_subnets}"]
}

# NAT gateways
output "nat_public_ips" {
  description = "List of public Elastic IPs created for AWS NAT Gateway"
  value       = ["${module.core.nat_public_ips}"]
}