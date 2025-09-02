# ---------------- Jumphost (Bastion Host) ----------------
resource "aws_instance" "jumphost" {
  ami                         = var.ami_id_g
  instance_type               = var.instance_type
  key_name                    = var.key_name
  subnet_id                   = var.public_subnet1_id
  vpc_security_group_ids      = [var.jumphost_sg_id]
  associate_public_ip_address = true

  tags = {
    Name = "Bastion Host"
  }

  # SSH connection using the PEM file
  connection {
    type        = "ssh"
    user        = "ubuntu"
    host        = self.public_ip
    timeout     = "2m"
    agent       = false
  }
}

# ---------------- Prometheus Instances ----------------
resource "aws_instance" "prom1" {
  ami                    = var.ami_id_prom
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet1_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.prom_sg_id]

  tags = {
    Name = "prom1"
  }
}

resource "aws_instance" "prom2" {
  ami                    = var.ami_id_prom
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet1_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.prom_sg_id]

  tags = {
    Name = "prom2"
  }
}

resource "aws_instance" "prom3" {
  ami                    = var.ami_id_prom
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet2_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.prom_sg_id]

  tags = {
    Name = "prom3"
  }
}

resource "aws_instance" "prom4" {
  ami                    = var.ami_id_prom
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet2_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.prom_sg_id]

  tags = {
    Name = "prom4"
  }
}

# ---------------- Grafana Instances ----------------
resource "aws_instance" "grafana1" {
  ami                    = var.ami_id_g
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet1_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.g_sg_id]

  tags = {
    Name = "grafana1"
  }
}

resource "aws_instance" "grafana2" {
  ami                    = var.ami_id_g
  instance_type          = var.instance_type
  subnet_id              = var.private_subnet2_id
  key_name               = var.key_name
  vpc_security_group_ids = [var.g_sg_id]

  tags = {
    Name = "grafana2"
  }
}
