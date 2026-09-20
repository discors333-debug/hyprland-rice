#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "### 1/4  Installing packages"
"$REPO_DIR/install-packages.sh"

echo "### 2/4  Cloning rice source repos into \$HOME"
"$REPO_DIR/clone-rice-sources.sh"

echo "### 3/4  Linking configs"
"$REPO_DIR/install.sh"

echo "### 4/4  Installing infinite-desktop scripts"
"$REPO_DIR/install-infinite-desktop.sh"

cat <<'EOF'

### Setup complete.

Remaining manual steps:
  1. Make zsh your login shell:   chsh -s $(which zsh)
  2. Log out and back in (needed for zsh, and for the 'input' group used by
     the infinite-desktop scripts, to take effect).
  3. At your login/display manager, pick a Hyprland session and log in.

See README.md for a full walkthrough and keybind reference.
EOF
