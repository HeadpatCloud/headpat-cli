# headpat_dns_record

One record set in a zone: every value of a given name and type. Creating or updating the resource replaces the whole set.

```hcl
resource "headpat_dns_record" "www" {
  zone_id = headpat_dns_zone.example.id
  name    = "www.example.com"
  type    = "A"
  ttl     = 300
  values  = ["203.0.113.4", "203.0.113.5"]
}

resource "headpat_dns_record" "spf" {
  zone_id = headpat_dns_zone.example.id
  name    = "example.com"
  type    = "TXT"
  values  = ["\"v=spf1 -all\""]
}
```

## Argument reference

- `zone_id` (String, Required, forces replacement) The zone.
- `name` (String, Required, forces replacement) Fully qualified record name. A trailing dot is accepted.
- `type` (String, Required, forces replacement) One of `A`, `AAAA`, `CAA`, `CNAME`, `MX`, `SRV`, `TXT`.
- `values` (List of String, Required) Record contents. TXT values must be quoted as they appear in a zone file.
- `ttl` (Number, Optional, default `3600`) Seconds, 60 to 86400.

## Attribute reference

- `id` (String) `<zone-id>/<name>/<type>`.

## Import

```bash
terraform import headpat_dns_record.www <zone-id>/www.example.com/A
```
