# Bastion Host EC2 Instance
resource "aws_instance" "bastion" {
  ami                         = "ami-0c7217cdde317cfec" # Amazon Linux 2023 in us-east-1
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_1.id
  vpc_security_group_ids      = [aws_security_group.bastion_sg.id]
  key_name                    = aws_key_pair.generated_key.key_name
  associate_public_ip_address = true

  tags = {
    Name = "bastion-host"
  }
}

# Application EC2 Instance
resource "aws_instance" "application" {
  ami                    = "ami-0c7217cdde317cfec" # Amazon Linux 2023 in us-east-1
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private_1.id
  vpc_security_group_ids = [aws_security_group.app_sg.id]
  key_name               = aws_key_pair.generated_key.key_name

  tags = {
    Name = "application-server"
  }
}