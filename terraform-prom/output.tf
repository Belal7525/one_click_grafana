output "vpc_id" {
  description = "VPC ka ID"
  value       = module.vpc.vpc_id
}

output "public_subnet1_id" {
  description = "Public Subnet 1 ka ID"
  value       = module.subnet.public_subnet1_id
}

output "public_subnet2_id" {
  description = "Public Subnet 2 ka ID"
  value       = module.subnet.public_subnet2_id
}

output "private_subnet1_id" {
  description = "Private Subnet 1 ka ID"
  value       = module.subnet.private_subnet1_id
}

output "private_subnet2_id" {
  description = "Private Subnet 2 ka ID"
  value       = module.subnet.private_subnet2_id
}

output "internet_gateway_id" {
  description = "Internet Gateway ka ID"
  value       = module.internet_gateway.project_igw_id
}

output "nat_gateway_id" {
  description = "NAT Gateway ka ID"
  value       = module.nat_gateway.project_natgw_id
}

output "jumphost_sg_id" {
  description = "Jumphost Security Group ID"
  value       = module.security_groups.jumphost_sg_id
}

output "prom_sg_id" {
  description = "Prometheus Security Group ID"
  value       = module.security_groups.prom_sg_id
}

output "g_sg_id" {
  description = "Grafana Security Group ID"
  value       = module.security_groups.g_sg_id
}

output "alb_id" {
  description = "ALB ka ID"
  value       = module.alb.alb_id
}