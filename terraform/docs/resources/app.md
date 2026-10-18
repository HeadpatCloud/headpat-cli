# headpat_app

A managed app from the catalog. Use `data.headpat_app_catalog` for template and tier slugs.

```hcl
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
```

## Argument reference

- `template` (String, Required, forces replacement) Catalog template slug.
- `tier` (String, Required, forces replacement) Tier slug of that template.
- `name` (String, Required, forces replacement) Display name.
- `slug` (String, Optional, forces replacement) Hostname slug; generated when omitted.
- `version_image` (String, Optional, forces replacement) Pin a catalog version image at creation.
- `image` (String, Optional) Container App: image reference. Changing it redeploys the app.
- `port` (Number, Optional) Container App: port the image listens on. Required with `image`.
- `env` (Map of String, Optional) Container App: environment variables. The whole set is replaced on change.
- `volume_path` (String, Optional) Container App: mount path of a persistent volume.
- `delete_immediately` (Boolean, Optional, default `false`) Destroy deletes the app right away instead of cancelling at the end of the billing period.
- `create_timeout_minutes` (Number, Optional, default `10`) How long creation waits for `running` when no payment step is needed.

## Attribute reference

- `id` (String) App id.
- `status` (String) Lifecycle status, e.g. `provisioning`, `running`, `stopped`, `draft`.
- `hostname` (String) The app's default hostname.
- `checkout_url` (String) Stripe checkout to complete when the account pays per resource; null once the app is paid for.

## Import

```bash
terraform import headpat_app.api <app-id>
```
