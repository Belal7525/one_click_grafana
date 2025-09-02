variable "ami_id_g" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "ami_id_prom" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_type" {
  description = "Instance type for the EC2 instances"
  type        = string
}

variable "public_subnet1_id" {
  description = "ID of the first private subnet"
  type        = string
}

variable "private_subnet1_id" {
  description = "ID of the first private subnet"
  type        = string
}

variable "private_subnet2_id" {
  description = "ID of the second private subnet"
  type        = string
}

variable "jumphost_sg_id" {
  description = "ID of the prom security group"
  type        = string
}

variable "prom_sg_id" {
  description = "ID of the prom security group"
  type        = string
}

variable "g_sg_id" {
  description = "ID of the grafana security group"
  type        = string
}

variable "key_name" {
  description = "Name of the AWS key pair"
  default     = "ubuntu"
}

variable "key_file_path" {
  description = "Path to the private key file (.pem)"
  default     = "ubuntu.pem"
}
