# headpat_dns_zone

A DNS zone hosted on the panel nameservers.

```hcl
resource "headpat_dns_zone" "example" {
  zone_name = "example.com"
}
```

## Argument reference

- `zone_name` (String, Required, forces replacement) Zone apex. A trailing dot is accepted.
- `domain_id` (String, Optional, forces replacement) Registrar domain to link, when the domain is registered through the panel.

## Attribute reference

- `id` (String) Zone id.
- `status` (String) Zone status.

## Import

```bash
terraform import headpat_dns_zone.example <zone-id>
```
