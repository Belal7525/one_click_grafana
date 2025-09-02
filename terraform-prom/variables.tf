variable "vpc_cidr" {
  description = "VPC ka CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "VPC ka naam"
  type        = string
  default     = "project-vpc"
}

variable "az1" {
  description = "Availability Zone 1"
  type        = string
  default     = "us-east-1a"
}

variable "az2" {
  description = "Availability Zone 2"
  type        = string
  default     = "us-east-1b"
}

variable "igw_name" {
  description = "Internet Gateway ka naam"
  type        = string
  default     = "project-igw"
}

variable "nat_gateway_name" {
  description = "NAT Gateway ka naam"
  type        = string
  default     = "project-natgw"
}

variable "instance_type" {
  description = "EC2 instance ka type"
  type        = string
  default     = "t2.micro"
}

variable "ami_id_g" {
  description = "Jumphost ke liye AMI ID"
  type        = string
  default     = "ami-0f9de6e2d2f067fca"
}

variable "ami_id_prom" {
  description = "Prometheus ke liye AMI ID"
  type        = string
  default     = "ami-0f9de6e2d2f067fca"
}

variable "alb_name" {
  description = "ALB ka naam"
  type        = string
  default     = "project-lb"
}

