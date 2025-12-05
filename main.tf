module "network" {
  source = "./network"

}

module "ec2" {
  source = "./ec2"
  ami    = var.ami
  instance_type = var.instance_type
  sg_id = module.network.sg_id
}

