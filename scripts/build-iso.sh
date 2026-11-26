#!/usr/bin/env bash
set -Eeuo pipefail

# - by ChatGPT Ai
# Minimal Debian 13 live-build scaffold for YouthOS-Enterprise.
# Run inside a Debian 13 environment with live-build installed.

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$ROOT_DIR"

if [[ "$(id -u)" -ne 0 ]]; then
  echo "Run this script as root (for example: sudo ./scripts/build-iso.sh)." >&2
  exit 1
fi

if ! command -v lb >/dev/null 2>&1; then
  echo "live-build is required. Install it with: apt install live-build" >&2
  exit 1
fi

if [[ ! -f config/package-lists/enterprise-base.list.chroot ]]; then
  echo "Missing enterprise base package list." >&2
  exit 1
fi

export LB_DEBIAN_INSTALLER="false"

lb clean --purge || true
lb config \
  --distribution trixie \
  --architectures amd64 \
  --binary-images iso-hybrid \
  --debian-installer none \
  --archive-areas "main contrib non-free-firmware" \
  --apt-recommends false

lb build

echo "Build finished. Check the generated ISO in: $ROOT_DIR"
