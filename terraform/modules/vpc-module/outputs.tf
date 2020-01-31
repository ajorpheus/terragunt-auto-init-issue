output "vpc_id" {
  value       = aws_vpc.this.id
  description = "The VPC id created"
}

output "availability_zones" {
  value = data.aws_availability_zones.available.names
}
