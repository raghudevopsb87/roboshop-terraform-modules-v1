module "network" {
  source = "./network"

}

module "ec2" {
  for_each = var.component_name
  source = "./ec2"
  ami    = var.ami
  instance_type = var.instance_type
  sg_id = module.network.sg_id
  component_name = each.key
}

module "route53" {
  for_each = var.component_name
  source = "./route53"
  component_name = each.key
  private_ip = module.ec2[each.key].private_ip
  zone_id = var.zone_id
}


module "ansible" {

  for_each = var.component_name

  depends_on = [
    module.route53
  ]

  source = "./ansible"

  component_name = each.key
  private_ip     = module.ec2[each.key].private_ip
}

