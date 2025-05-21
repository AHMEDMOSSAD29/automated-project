# Security Group for Bastion Host
resource "aws_security_group" "bastion_sg" {
  name        = "bastion-sg"
  description = "Allow SSH from anywhere"
  vpc_id      = aws_vpc.main.id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "bastion-sg"
  }
}

# Security Group for Application Server
resource "aws_security_group" "app_sg" {
  name        = "app-sg"
  description = "Allow SSH and port 3000 from VPC"
  vpc_id      = aws_vpc.main.id

  ingress {
    description     = "Allow traffic from ALB"
    from_port       = 80
    to_port         = 80
    protocol        = "tcp"
    security_groups = [aws_security_group.lb_sg.id]
  }

  ingress {
    description = "SSH from VPC"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  ingress {
    description = "App port 3000 from VPC"
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.main.cidr_block]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "app-sg"
  }
}
# # Security Group for RDS
# resource "aws_security_group" "rds" {
#   name        = "rds-sg"
#   description = "Allow access to RDS MySQL"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     description     = "MySQL access from application servers"
#     from_port       = 3306
#     to_port         = 3306
#     protocol        = "tcp"
#     security_groups = [aws_security_group.app_sg.id] # Only allow from app servers
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "rds-mysql-sg"
#   }
# }

# # Security Group for Redis
# resource "aws_security_group" "redis" {
#   name        = "redis-sg"
#   description = "Allow access to Redis"
#   vpc_id      = aws_vpc.main.id

#   ingress {
#     description     = "Redis access from application servers"
#     from_port       = 6379
#     to_port         = 6379
#     protocol        = "tcp"
#     security_groups = [aws_security_group.app_sg.id] # Only allow from app servers
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "redis-sg"
#   }
# }

