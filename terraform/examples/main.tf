terraform {
  required_providers {
    headpat = {
      source = "headpatcloud/headpat"
    }
  }
}

# api_key comes from HEADPAT_API_KEY; create one under Dashboard > API keys with
# apps:read, apps:write, dns:read and dns:write.
provider "headpat" {}

data "headpat_app_catalog" "all" {}

resource "headpat_dns_zone" "example" {
  zone_name = "example.com"
}

resource "headpat_app" "api" {
  template = "container-app"
  tier     = "standard"
  name     = "api"
  image    = "ghcr.io/acme/api:1.4.0"
  port     = 3000
  env = {
    NODE_ENV = "production"
  }
  volume_path = "/data"
}

resource "headpat_app_domain" "api" {
  app_id   = headpat_app.api.id
  hostname = "api.example.com"
}

resource "headpat_dns_record" "api" {
  zone_id = headpat_dns_zone.example.id
  name    = "api.example.com"
  type    = "CNAME"
  values  = [headpat_app_domain.api.dns_target]
}

resource "headpat_dns_record" "api_ownership" {
  zone_id = headpat_dns_zone.example.id
  name    = "${headpat_app_domain.api.ownership_txt_label}.api.example.com"
  type    = "TXT"
  values  = ["\"${headpat_app_domain.api.ownership_txt_value}\""]
}

output "app_hostname" {
  value = headpat_app.api.hostname
}

output "checkout_url" {
  description = "Set when the account pays per resource; complete it to start provisioning."
  value       = headpat_app.api.checkout_url
}
