# headpat provider

Manages Headpat panel resources: apps, custom hostnames, DNS zones and records.

## Authentication

Create an API key under Dashboard > API keys with the scopes the configuration needs (`apps:read`, `apps:write`, `dns:read`, `dns:write`). Pass it as `api_key` or through `HEADPAT_API_KEY`.

```hcl
provider "headpat" {
  api_key = var.headpat_api_key
}
```

## Schema

- `api_key` (String, Sensitive, Optional) Panel API key. Defaults to `HEADPAT_API_KEY`.
- `url` (String, Optional) API origin. Defaults to `HEADPAT_API_URL`, then `https://api.headpat.space`.

## Payment

Accounts that pay per resource receive a `checkout_url` on `headpat_app` creation. The app is a draft until the checkout is completed; the provider does not wait for that, and the next refresh reports the new status.
