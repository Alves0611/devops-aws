output "internet_gateway_id" {
  value = aws_internet_gateway.this.id
}

output "nat_gateway_id" {
  value = aws_nat_gateway.this[0].id
}

output "private_subnets_arn" {
  value = aws_subnet.private[*].arn
}

output "public_subnets_arn" {
  value = aws_subnet.public[*].arn
}

output "private_subnet_ids" {
  value       = aws_subnet.private[*].id
  description = "IDs of the private subnets"
}
