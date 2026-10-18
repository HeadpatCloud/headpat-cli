# headpat_dns_zones (data source)

All DNS zones the API key can see.

```hcl
data "headpat_dns_zones" "all" {}

locals {
  example_zone_id = [for z in data.headpat_dns_zones.all.zones : z.id if z.zone_name == "example.com."][0]
}
```

## Attribute reference

- `zones` (List of Object)
  - `id` (String) Zone id.
  - `zone_name` (String) Zone apex with a trailing dot.
  - `status` (String) Zone status.
