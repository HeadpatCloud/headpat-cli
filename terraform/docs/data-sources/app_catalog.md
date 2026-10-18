# headpat_app_catalog (data source)

Templates and tiers the API key's account can order. Use it to look up slugs for `headpat_app`.

```hcl
data "headpat_app_catalog" "all" {}

locals {
  redis_tiers = [for t in data.headpat_app_catalog.all.templates : t.tiers if t.slug == "redis"][0]
}
```

## Attribute reference

- `templates` (List of Object)
  - `slug` (String) Template slug used by `headpat_app.template`.
  - `name` (String)
  - `kind` (String) Template kind, e.g. `static`, `wordpress`, `postgres`, `custom`.
  - `tiers` (List of Object)
    - `slug` (String) Tier slug used by `headpat_app.tier`.
    - `name` (String)
    - `price_cents` (Number) Monthly price in cents.
