resource "aws_lb" "project_lb" {
  name               = var.alb_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.lb_sg_id]
  subnets            = [var.public_subnet1_id, var.public_subnet2_id]

  enable_deletion_protection = false

  tags = {
    Name = var.alb_name
  }
}

resource "aws_lb_target_group" "prom_tg" {
  name     = "prom-tg"
  port     = 9090
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 3
    interval            = 30
  }
}

resource "aws_lb_target_group_attachment" "prom1" {
  target_group_arn = aws_lb_target_group.prom_tg.arn
  target_id        = var.prom1_id
  port             = 9090
}

resource "aws_lb_target_group_attachment" "prom2" {
  target_group_arn = aws_lb_target_group.prom_tg.arn
  target_id        = var.prom2_id
  port             = 9090
}

resource "aws_lb_target_group_attachment" "prom3" {
  target_group_arn = aws_lb_target_group.prom_tg.arn
  target_id        = var.prom3_id
  port             = 9090
}

resource "aws_lb_target_group_attachment" "prom4" {
  target_group_arn = aws_lb_target_group.prom_tg.arn
  target_id        = var.prom4_id
  port             = 9090
}

resource "aws_lb_target_group" "grafana_tg" {
  name     = "grafana-tg"
  port     = 3000
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    port                = "traffic-port"
    healthy_threshold   = 3
    unhealthy_threshold = 3
    timeout             = 3
    interval            = 30
  }
}

resource "aws_lb_target_group_attachment" "grafana1" {
  target_group_arn = aws_lb_target_group.grafana_tg.arn
  target_id        = var.grafana1_id
  port             = 3000
}

resource "aws_lb_target_group_attachment" "grfana2" {
  target_group_arn = aws_lb_target_group.grafana_tg.arn
  target_id        = var.grafana2_id
  port             = 3000
}

resource "aws_lb_listener" "prom_listener" {
  load_balancer_arn = aws_lb.project_lb.arn
  port              = 9090
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.prom_tg.arn
  }
}

resource "aws_lb_listener" "grafana_listener" {
  load_balancer_arn = aws_lb.project_lb.arn
  port              = 3000
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.grafana_tg.arn
  }
}