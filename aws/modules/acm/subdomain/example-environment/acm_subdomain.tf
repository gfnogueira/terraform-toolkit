// Example: ACM Certificate for a subdomain with DNS validation
// This example demonstrates how to use the acm/subdomain module to create an SSL certificate
// for a subdomain, with DNS validation using Route53. All required variables are set and explained.

locals {
  organization_name = "my-comp-org"
  account_name      = "dev"
  domain_name       = "example.com"         // Your root domain
  domain_signed     = "app.example.com"     // The subdomain you want the certificate for
}

module "acm_subdomain" {
  source = "../../"

  // The root domain for the certificate (e.g., example.com)
  domain_name = local.domain_name

  // The subdomain to be signed (e.g., app.example.com)
  domain_signed = local.domain_signed

  // Validation method: DNS (recommended for automation)
  validation_method = "DNS"

  // TTL for the DNS validation record
  certificate_validation_ttl = 60

  // Organization and account tags for traceability
  organization_name = local.organization_name
  account_name      = local.account_name
}

// Output the ARN of the created certificate
output "certificate_arn" {
  value = module.acm_subdomain.arn
}

// After apply, check AWS ACM for the new certificate and Route53 for validation records.
// You can now use this certificate ARN in your load balancers, CloudFront, etc.
