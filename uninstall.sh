#!/usr/bin/env bash
# Removes the right-click action and the tarignite script.
# Apps you already installed with it stay in place; remove them with:
#   tarignite --remove "<app name>"   (run BEFORE running this uninstaller)
set -eu

rm -f "$HOME/.local/bin/tarignite"
rm -f "$HOME/.local/share/nemo/actions/tarignite.nemo_action"
nemo -q 2>/dev/null || true
echo "tarignite removed."
