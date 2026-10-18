# headpat_app_domain

A custom hostname attached to an app. Publish the DNS values the resource exposes; the panel validates ownership and issues the certificate.

```hcl
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
```

## Argument reference

- `app_id` (String, Required, forces replacement) The app.
- `hostname` (String, Required, forces replacement) Fully qualified hostname.

## Attribute reference

- `id` (String) Domain id.
- `validation_status` (String) `pending`, `verified` or `failed`.
- `cert_ready` (Boolean) Whether the TLS certificate has been issued.
- `dns_target` (String) CNAME target.
- `dns_alternative_a` (String) A record value for apex names that cannot use a CNAME.
- `ownership_txt_label` (String) Label of the ownership TXT record, relative to the hostname.
- `ownership_txt_value` (String) Value of the ownership TXT record.

## Import

```bash
terraform import headpat_app_domain.api <app-id>/<domain-id>
```
