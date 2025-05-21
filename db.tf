# # RDS MySQL Instance
# resource "aws_db_instance" "mysql" {
#   identifier             = "prod-mysql-db"
#   engine                 = "mysql"
#   engine_version         = "8.0" # Specify your desired version
#   instance_class         = "db.t3.micro"
#   allocated_storage      = 20
#   max_allocated_storage  = 100  # Enable storage autoscaling
#   storage_type           = "gp2"
#   db_name                = "application_db"
#   username               = var.db_username
#   password               = var.db_password
#   parameter_group_name   = aws_db_parameter_group.mysql.id
#   db_subnet_group_name   = aws_db_subnet_group.rds.name
#   vpc_security_group_ids = [aws_security_group.rds.id]
#   skip_final_snapshot    = true # Set to false for production
#   publicly_accessible    = false
#   multi_az               = false # Set to true for production HA
#   backup_retention_period = 7
#   deletion_protection    = false # Set to true for production

#   tags = {
#     Name = "production-mysql"
#   }
# }

# # RDS Parameter Group
# resource "aws_db_parameter_group" "mysql" {
#   name   = "mysql-80-parameters"
#   family = "mysql8.0"

#   parameter {
#     name  = "character_set_server"
#     value = "utf8mb4"
#   }

#   parameter {
#     name  = "character_set_client"
#     value = "utf8mb4"
#   }
# }

# # RDS Subnet Group
# resource "aws_db_subnet_group" "rds" {
#   name       = "rds-subnet-group"
#   subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]

#   tags = {
#     Name = "RDS Subnet Group"
#   }
# }

# # ElastiCache Redis Cluster
# resource "aws_elasticache_cluster" "redis" {
#   cluster_id           = "prod-redis-cluster"
#   engine               = "redis"
#   node_type            = "cache.t3.micro"
#   num_cache_nodes      = 1
#   parameter_group_name = "default.redis6.x"
#   engine_version       = "6.x"
#   port                 = 6379
#   subnet_group_name    = aws_elasticache_subnet_group.redis.name
#   security_group_ids   = [aws_security_group.redis.id]
# }

# # ElastiCache Subnet Group
# resource "aws_elasticache_subnet_group" "redis" {
#   name       = "redis-subnet-group"
#   subnet_ids = [aws_subnet.private_1.id, aws_subnet.private_2.id]
# }

