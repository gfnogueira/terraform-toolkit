data "aws_route53_zone" "selected" {
  name     = var.domain_name
}
