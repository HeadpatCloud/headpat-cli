# headpat_app (data source)

An existing app, looked up by id.

```hcl
data "headpat_app" "site" {
  id = "5af91794-d5e6-4f21-83e5-c9896f91c6d9"
}

output "site_hostname" {
  value = data.headpat_app.site.hostname
}
```

## Argument reference

- `id` (String, Required) App id.

## Attribute reference

- `name` (String) Display name.
- `slug` (String) Hostname slug.
- `status` (String) Lifecycle status.
- `template` (String) Template slug.
- `tier` (String) Tier slug.
- `hostname` (String) Default hostname.
