# Outputs
output "bastion_public_ip" {
  value = aws_instance.bastion.public_ip
}

output "application_private_ip" {
  value = aws_instance.application.private_ip
}

output "ssh_key_secret_name" {
  value = aws_secretsmanager_secret.ssh_key.name
}

output "ssh_command" {
  value = "ssh -i admin.pem ubuntu@${aws_instance.bastion.public_ip}"
}

# output "rds_endpoint" {
#   description = "RDS MySQL endpoint"
#   value       = aws_db_instance.mysql.endpoint
# }

# output "redis_endpoint" {
#   description = "ElastiCache Redis endpoint"
#   value       = aws_elasticache_cluster.redis.cache_nodes[0].address
# }

# output "lb_dns_name" {
#   description = "The DNS name of the load balancer"
#   value       = aws_lb.app_lb.dns_name
# }

# Output just the command to retrieve the private key
output "retrieve_key_command" {
  value = <<EOF
  Run this command to get the private key:
  aws secretsmanager get-secret-value \
    --secret-id ${aws_secretsmanager_secret.ssh_key.name} \
    --query SecretString \
    --output text > admin.pem && chmod 600 admin.pem
  EOF
}