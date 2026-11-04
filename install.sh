#!/usr/bin/env bash
# Sets up the "Install this app" right-click action in Nemo (Linux Mint Cinnamon).
set -eu

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BIN_DIR="$HOME/.local/bin"
ACTION_DIR="$HOME/.local/share/nemo/actions"

missing=()
for cmd in zenity file tar; do
  command -v "$cmd" >/dev/null 2>&1 || missing+=("$cmd")
done
if [ "${#missing[@]}" -gt 0 ]; then
  echo "Installing missing packages: ${missing[*]}"
  sudo apt install -y "${missing[@]}"
fi

mkdir -p "$BIN_DIR" "$ACTION_DIR"

# Clean up the pre-release name of this tool, if present
rm -f "$BIN_DIR/install-targz" "$ACTION_DIR/install-targz.nemo_action"

install -m 755 "$HERE/bin/tarignite" "$BIN_DIR/tarignite"

cat > "$ACTION_DIR/tarignite.nemo_action" <<EOF
[Nemo Action]
Name=Install this app
Comment=Extract this archive and add the app to your menu
Exec=$BIN_DIR/tarignite %F
Icon-Name=system-software-install
Selection=s
Extensions=gz;tgz;xz;txz;bz2;tbz2;
Quote=double
EOF

echo
echo "Tarignite is installed."
echo "Restarting Nemo so the right-click entry appears (open file windows will close)..."
nemo -q 2>/dev/null || true
echo
echo "Right-click any .tar.gz file and choose 'Install this app'."
echo "Saved you some time? A star helps others find it: https://github.com/IvanFieryPrince/tarignite"
