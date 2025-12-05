module "network" {
  source = "./network"

}

module "ec2" {
  source = "./ec2"
  ami    = var.ami
  instance_type = var.instance_type
  sg_id = module.network.sg_id
  component_name = var.component_name
}

module "route53" {
  source = "./route53"
  component_name = var.component_name
  private_ip = module.ec2.ec2.private_ip
  zone_id = var.zone_id
}


