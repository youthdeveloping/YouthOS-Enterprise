# YouthOS-Enterprise Architecture

## 1. Design principles

1. Debian remains the trusted package and security-update foundation.
2. Profiles are declarative and small; avoid one oversized image for every deployment.
3. Administrative features must have explicit authorization boundaries.
4. Central management must use authenticated enrollment, TLS, revocation, and auditable policy delivery.
5. The OS must remain usable if an optional management service is unavailable.

## 2. System layers

| Layer | Responsibility | Initial approach |
| --- | --- | --- |
| Base OS | Kernel, init, packages, updates | Debian 13 |
| Desktop | Session, panel, accessibility, appearance | XFCE |
| Identity | Local accounts and groups | Debian/PAM tooling |
| Device policy | Configuration profiles | Versioned local policy files first |
| Management | Fleet enrollment and inventory | Design phase; not enabled yet |
| Applications | Approved software catalog | APT and documented packages |
| Server | Headless installation profile | Minimal Debian live system |

## 3. Deployment profiles

### Enterprise Desktop
A standard workstation for staff and administrators. Local administration remains restricted and user data is separated by account.

### Education Lab
Shared devices with predictable configuration, non-admin student accounts, and a documented reset/recovery strategy. Monitoring must be transparent and limited to legitimate administration.

### Server
A minimal headless profile. No desktop packages by default. Remote administration must be explicitly enabled and protected.

### Evaluation
A non-production profile for testing package changes, policies, and upgrades.

## 4. Security boundaries

- Never ship default shared passwords or embedded API tokens.
- Do not silently enroll devices or collect personal data.
- Require administrator authorization for privileged actions.
- Keep security updates enabled and document any exceptions.
- Log administrative configuration changes without logging passwords or secrets.
- Provide a documented way to leave an organization-managed state.
- Central management is not considered implemented until authentication, authorization, transport security, audit, and revocation are tested.

## 5. Repository layout

- `config/`: live-build configuration and package lists
- `desktop/`: desktop defaults and branding
- `enterprise/`: policy schemas and future management components
- `server/`: server profile configuration
- `scripts/`: reproducible build helpers
- `docs/`: architecture, security, testing, and release documentation
- `.github/workflows/`: CI build workflow

## 6. Build outputs

CI artifacts are for evaluation only until boot tests, installer tests, upgrade tests, and security review pass. A successful workflow run does not mean the ISO is production-ready.
