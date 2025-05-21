variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "The name tag for the VPC"
}

# variables.tf

variable "public_subnet_1_cidr" {
  type        = string
  description = "CIDR block for the first public subnet"
}

variable "public_subnet_1_az" {
  type        = string
  description = "Availability zone for the first public subnet"
}

variable "public_subnet_1_name" {
  type        = string
  description = "Name tag for the first public subnet"
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "CIDR block for the second public subnet"
}

variable "public_subnet_2_az" {
  type        = string
  description = "Availability zone for the second public subnet"
}

variable "public_subnet_2_name" {
  type        = string
  description = "Name tag for the second public subnet"
}

variable "private_subnet_1_cidr" {
  type        = string
  description = "CIDR block for the first private subnet"
}

variable "private_subnet_1_az" {
  type        = string
  description = "Availability zone for the first private subnet"
}

variable "private_subnet_1_name" {
  type        = string
  description = "Name tag for the first private subnet"
}

variable "private_subnet_2_cidr" {
  type        = string
  description = "CIDR block for the second private subnet"
}

variable "private_subnet_2_az" {
  type        = string
  description = "Availability zone for the second private subnet"
}

variable "private_subnet_2_name" {
  type        = string
  description = "Name tag for the second private subnet"
}

 
variable "db_username" {
  description = "Database administrator username"
  type        = string
  sensitive   = true
}

variable "db_password" {
  description = "Database administrator password"
  type        = string
  sensitive   = true
}