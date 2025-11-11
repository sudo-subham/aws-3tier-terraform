# ----------------------------
# Terraform Outputs
# ----------------------------

output "alb_dns_name" {
  description = "Application Load Balancer DNS"
  value       = aws_lb.app_lb.dns_name
}

output "rds_endpoint" {
  description = "RDS Database Endpoint"
  value       = aws_db_instance.rds.address
}

output "vpc_id" {
  description = "VPC ID"
  value       = aws_vpc.main.id
}

output "public_subnet_ids" {
  description = "Public Subnet IDs"
  value       = [aws_subnet.public_1.id, aws_subnet.public_2.id]
}

output "private_subnet_ids" {
  description = "Private Subnet IDs"
  value       = [aws_subnet.private_1.id, aws_subnet.private_2.id]
}
