#!/usr/bin/env bash
set -euo pipefail

declare -A REPOS=(
  [HyprNova]="https://github.com/zDyant/HyprNova"
  [Hyprlock-Dots]="https://github.com/mahaveergurjar/Hyprlock-Dots"
  [hyprzepyx]="https://github.com/xZepyx/HyprZepyx"
  [rofi]="https://github.com/adi1090x/rofi"
  [powerlevel10k]="https://github.com/romkatv/powerlevel10k"
)

for name in "${!REPOS[@]}"; do
  dest="$HOME/$name"
  if [ -e "$dest" ]; then
    echo "==> $dest already exists, skipping."
    continue
  fi
  echo "==> Cloning ${REPOS[$name]} -> $dest"
  git clone "${REPOS[$name]}" "$dest"
done
