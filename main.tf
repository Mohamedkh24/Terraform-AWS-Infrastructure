module "vpc" {
  source = "./modules/vpc"
}

module "subnets" {
  source = "./modules/subnets"
  vpc_id = module.vpc.vpc_id
  igw_id = module.vpc.igw_id
}

module "instances" {
  source = "./modules/ec2-instances"
  public_sub1_id = module.subnets.public_sub1_id
  public_sub2_id = module.subnets.public_sub2_id
  private_sub1_id = module.subnets.private_sub1_id
  private_sub2_id = module.subnets.private_sub2_id
  pub_sg_id = module.security_groups.pub_sg_id
  priv_sg_id = module.security_groups.priv_sg_id
  alb_dns_name = module.load_balancers.alb_dns_name
}

module "security_groups" {
  source = "./modules/security-groups"
  vpc_id = module.vpc.vpc_id
}

module "load_balancers" {
  source = "./modules/load-balancers"
  vpc_id = module.vpc.vpc_id
  public_sub1_id = module.subnets.public_sub1_id
  public_sub2_id = module.subnets.public_sub2_id
  private_sub1_id = module.subnets.private_sub1_id
  private_sub2_id = module.subnets.private_sub2_id
  alb_sg_id = module.security_groups.alb_sg_id
  pub1_instance_id = module.instances.pub1_instance_id
  pub2_instance_id = module.instances.pub2_instance_id
  priv1_instance_id = module.instances.priv1_instance_id
  priv2_instance_id = module.instances.priv2_instance_id
}