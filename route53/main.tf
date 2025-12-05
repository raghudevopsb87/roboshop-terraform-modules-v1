resource "aws_route53_record" "main" {
  zone_id = var.zone_id
  name    = "${var.component_name}-dev"
  type    = "A"
  ttl     = 30
  records = [var.private_ip]
}


