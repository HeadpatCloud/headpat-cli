# headpat CLI and Terraform provider

Release downloads for the Headpat panel clients. Both talk to the panel API with an API key created under Dashboard > API keys.

## CLI

Download the binary for your platform from the latest `vX.Y.Z` release, rename it to `headpat` (`headpat.exe` on Windows), put it on your `PATH` and run:

```bash
headpat login
```

| Platform | File |
| --- | --- |
| Linux x86-64 | `headpat-linux-x64` |
| Linux ARM64 | `headpat-linux-arm64` |
| macOS Apple silicon | `headpat-darwin-arm64` |
| macOS Intel | `headpat-darwin-x64` |
| Windows x86-64 | `headpat-windows-x64.exe` |

`SHA256SUMS` in each release lists the checksums. macOS may refuse an unsigned binary on first run; allow it under System Settings > Privacy & Security, or run `xattr -d com.apple.quarantine headpat`.

Every command takes `--json`. `headpat --help` lists the commands; anything else in the API is reachable with `headpat api <procedure> --input '{...}'`. The procedure names are in the API reference at https://api.headpat.space/api/docs.

## Terraform provider

Releases tagged `terraform-vX.Y.Z` carry registry-shaped zips for Linux, macOS and Windows plus `SHA256SUMS`. The provider is not on the public Terraform registry yet, so install it with a filesystem mirror or a dev override: see the guide at https://headpat.space/guides.

## Source

The clients are developed in the panel repository and published here. Issues and questions: contact@headpat.space or https://discord.gg/EaQTEKRg2A
