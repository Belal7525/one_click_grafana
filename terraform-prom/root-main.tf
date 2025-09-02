module "vpc" {
  source   = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  vpc_name = var.vpc_name
}

module "subnet" {
  source   = "./modules/subnet"
  vpc_id   = module.vpc.vpc_id
  vpc_cidr = var.vpc_cidr
  az1      = var.az1
  az2      = var.az2
}

module "internet_gateway" {
  source   = "./modules/internet_gateway"
  vpc_id   = module.vpc.vpc_id
  igw_name = var.igw_name
}

module "nat_gateway" {
  source            = "./modules/nat_gateway"
  public_subnet1_id = module.subnet.public_subnet1_id
  nat_gateway_name  = var.nat_gateway_name
}

module "route_table" {
  source             = "./modules/route_table"
  vpc_id             = module.vpc.vpc_id
  igw_id             = module.internet_gateway.project_igw_id
  nat_gateway_id     = module.nat_gateway.project_natgw_id
  public_subnet1_id  = module.subnet.public_subnet1_id
  public_subnet2_id  = module.subnet.public_subnet2_id
  private_subnet1_id = module.subnet.private_subnet1_id
  private_subnet2_id = module.subnet.private_subnet2_id
}

module "nacl" {
  source             = "./modules/nacl"
  vpc_id             = module.vpc.vpc_id
  public_subnet1_id  = module.subnet.public_subnet1_id
  public_subnet2_id  = module.subnet.public_subnet2_id
  private_subnet1_id = module.subnet.private_subnet1_id
  private_subnet2_id = module.subnet.private_subnet2_id
}

module "security_groups" {
  source = "./modules/security_groups"
  vpc_id = module.vpc.vpc_id
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id_g          = var.ami_id_g
  ami_id_prom       = var.ami_id_prom
  instance_type     = var.instance_type   

  public_subnet1_id = module.subnet.public_subnet1_id
  private_subnet1_id = module.subnet.private_subnet1_id
  private_subnet2_id = module.subnet.private_subnet2_id

  jumphost_sg_id = module.security_groups.jumphost_sg_id
  prom_sg_id     = module.security_groups.prom_sg_id
  g_sg_id        = module.security_groups.g_sg_id
}

module "alb" {
  source            = "./modules/alb"
  alb_name          = var.alb_name
  lb_sg_id          = module.security_groups.lb_sg_id
  public_subnet1_id = module.subnet.public_subnet1_id
  public_subnet2_id = module.subnet.public_subnet2_id
  vpc_id            = module.vpc.vpc_id

  prom1_id    = module.ec2.prom1_id
  prom2_id    = module.ec2.prom2_id
  prom3_id    = module.ec2.prom3_id
  prom4_id    = module.ec2.prom4_id
  grafana1_id = module.ec2.grafana1_id
  grafana2_id = module.ec2.grafana2_id
}