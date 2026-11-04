#!/usr/bin/env bash
# One-line installer for Tarignite:
#   curl -fsSL https://raw.githubusercontent.com/IvanFieryPrince/tarignite/main/get.sh | bash
set -eu

REPO="IvanFieryPrince/tarignite"
URL="https://github.com/$REPO/archive/refs/heads/main.tar.gz"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

echo "Downloading Tarignite..."
if command -v curl >/dev/null 2>&1; then
  curl -fsSL "$URL" | tar -xz -C "$TMP"
elif command -v wget >/dev/null 2>&1; then
  wget -qO- "$URL" | tar -xz -C "$TMP"
else
  echo "Error: neither curl nor wget is installed. Run: sudo apt install curl" >&2
  exit 1
fi

bash "$TMP/tarignite-main/install.sh"
