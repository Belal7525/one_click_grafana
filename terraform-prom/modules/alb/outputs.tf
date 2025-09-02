output "alb_id" {
  description = "The ID of the Application Load Balancer"
  value       = aws_lb.project_lb.id   # ya aws_lb.this.id (aapke resource ke naam ke hisaab se)
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.project_lb.dns_name   # ya aws_lb.this.dns_name
}
