# YouthOS-Enterprise

**A Debian-based operating system for schools, organizations, and managed workstations.**

YouthOS-Enterprise is a separate edition in the YouthOS family. It is designed for institutional desktops, shared computer labs, and lightweight server deployments while keeping the base system maintainable.

## Project goals

- **One foundation, multiple profiles:** desktop, school lab, organization workstation, and minimal server.
- **Manageability:** documented configuration and policy mechanisms, with centralized management introduced only after a secure enrollment design exists.
- **Security by default:** least privilege, signed packages, auditable changes, and no hard-coded credentials.
- **Lean by design:** install only the packages required by the selected profile.
- **Upstream respect:** prefer Debian packages and supported interfaces over maintaining unnecessary forks.

## Current status

<badge>Early foundation</badge>

This repository currently contains the project specification and initial build scaffolding. It is not yet a bootable or production-ready ISO. Hardware compatibility, installation, upgrades, security controls, and recovery must be tested before release.

## Planned profiles

| Profile | Purpose |
| --- | --- |
| Enterprise Desktop | Managed office and organization workstations |
| Education Lab | Shared school computers and classroom environments |
| Server | Minimal headless services and administration |
| Evaluation | Safe testing of new features before release |

## Build environment

- Base: Debian 13 (Trixie)
- Architecture: amd64 initially
- Build system: Debian live-build
- Desktop direction: lightweight XFCE with YouthOS-Enterprise styling
- Installer direction: Calamares, subject to integration and testing

See [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md) and [docs/ROADMAP.md](docs/ROADMAP.md).

## Build locally

A Debian 13 environment is recommended. Install the required tools:

```bash
sudo apt update
sudo apt install -y live-build debootstrap xorriso squashfs-tools
```

Then run:

```bash
sudo ./scripts/build-iso.sh
```

The first build is a minimal live image scaffold. It does not yet include the complete enterprise management stack or a validated installer.

## Contributing

Please open an issue before proposing major architectural changes. Never commit passwords, private keys, access tokens, real user records, or institution-specific secrets.

## License

The project license will be selected before the first public binary release. Until then, check the license of each upstream component independently.
