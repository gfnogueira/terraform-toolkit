// Example: ACM Certificate for a wildcard domain with DNS validation
// This example demonstrates how to use the acm/general module to create a wildcard SSL certificate
// for a domain, with DNS validation using Route53. All required variables are set and explained.

locals {
  organization_name = "my-comp-org"
  account_name      = "dev"
  domain_name       = "example.com" // Your root domain
}

module "acm_general" {
  source = "../../"

  // The root domain for the certificate (e.g., example.com)
  domain_name = local.domain_name

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
  value = module.acm_general.arn
}

// After apply, check AWS ACM for the new wildcard certificate and Route53 for validation records.
// You can now use this certificate ARN in your load balancers, CloudFront, etc.
