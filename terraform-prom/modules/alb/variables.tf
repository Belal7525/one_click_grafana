variable "alb_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "lb_sg_id" {
  description = "ID of the load balancer security group"
  type        = string
}

variable "public_subnet1_id" {
  description = "ID of the first public subnet"
  type        = string
}

variable "public_subnet2_id" {
  description = "ID of the second public subnet"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "prom1_id" {
  description = "ID of the first prom instance"
  type        = string
}

variable "prom2_id" {
  description = "ID of the second prom instance"
  type        = string
}

variable "prom3_id" {
  description = "ID of the third prom instance"
  type        = string
}

variable "prom4_id" {
  description = "ID of the fourth prom instance"
  type        = string
}

variable "grafana1_id" {
  description = "ID of the first grafana instance"
  type        = string
}

variable "grafana2_id" {
  description = "ID of the second grafana instance"
  type        = string
}

