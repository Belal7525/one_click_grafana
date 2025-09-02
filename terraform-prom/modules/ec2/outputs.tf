output "jumphost_id" {
  description = "ID of the jumphost instance"
  value       = aws_instance.jumphost.id
}

output "prom1_id" {
  description = "ID of the first prom instance"
  value       = aws_instance.prom1.id
}

output "prom2_id" {
  description = "ID of the second prom instance"
  value       = aws_instance.prom2.id
}

output "prom3_id" {
  description = "ID of the third prom instance"
  value       = aws_instance.prom3.id
}

output "prom4_id" {
  description = "ID of the fourth prom instance"
  value       = aws_instance.prom4.id
}

output "grafana1_id" {
  description = "ID of the first grafana instance"
  value       = aws_instance.grafana1.id
}

output "grafana2_id" {
  description = "ID of the second grafana instance"
  value       = aws_instance.grafana2.id
}
