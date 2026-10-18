# headpat CLI and Terraform provider

Release downloads for the Headpat panel clients. Both talk to the panel API with an API key created under Dashboard > API keys.

## CLI

Linux and macOS:

```bash
curl -fsSL https://headpat.space/install.sh | sh
```

Windows (PowerShell):

```powershell
irm https://headpat.space/install.ps1 | iex
```

The script picks the build for your system, checks it against `SHA256SUMS` and installs `headpat` into `~/.local/bin` (Windows: `%LOCALAPPDATA%\Programs\headpat`, added to your user `PATH`). `HEADPAT_VERSION=0.1.1` pins a version and `HEADPAT_INSTALL_DIR` changes the directory. Alpine and other musl systems need `apk add libstdc++ libgcc` first.

With Node.js 18 or newer there is nothing to install: `npx @headpat/cli apps list`, or `npm i -g @headpat/cli` for a `headpat` command.

Then:

```bash
headpat login
```

It opens the panel in your browser; approve the login there and pick its permissions, and the CLI stores a new API key for this machine. `headpat update` installs newer releases later.

To install by hand, download the file for your platform from the latest `vX.Y.Z` release, rename it to `headpat` (`headpat.exe` on Windows) and put it on your `PATH`:

| Platform | File |
| --- | --- |
| Linux x86-64 | `headpat-linux-x64` |
| Linux ARM64 | `headpat-linux-arm64` |
| Linux x86-64, musl (Alpine) | `headpat-linux-x64-musl` |
| Linux ARM64, musl (Alpine) | `headpat-linux-arm64-musl` |
| macOS Apple silicon | `headpat-darwin-arm64` |
| macOS Intel | `headpat-darwin-x64` |
| Windows x86-64 | `headpat-windows-x64.exe` |

`SHA256SUMS` in each release lists the checksums. macOS may refuse a binary downloaded in the browser on first run; allow it under System Settings > Privacy & Security, or run `xattr -d com.apple.quarantine headpat`.

Every command takes `--json`. `headpat --help` lists the commands; anything else in the API is reachable with `headpat api <procedure> --input '{...}'`. The procedure names are in the API reference at https://api.headpat.space/api/docs.

## Terraform provider

Releases tagged `terraform-vX.Y.Z` carry registry-shaped zips for Linux, macOS and Windows plus `SHA256SUMS`. The provider is not on the public Terraform registry yet, so install it with a filesystem mirror or a dev override: see the guide at https://headpat.space/guides. Resource and data source reference: [terraform/docs](terraform/docs); a complete example: [terraform/examples/main.tf](terraform/examples/main.tf).

## Source

The clients are developed in the panel repository and published here. Issues and questions: contact@headpat.space or https://discord.gg/EaQTEKRg2A
