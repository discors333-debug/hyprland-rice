#!/usr/bin/env bash
set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TIMESTAMP="$(date +%Y%m%d-%H%M%S)"

link() {
  local src="$1" dest="$2"
  mkdir -p "$(dirname "$dest")"
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "$dest.bak.$TIMESTAMP"
    echo "Backed up existing $dest -> $dest.bak.$TIMESTAMP"
  fi
  ln -s "$src" "$dest"
  echo "Linked $dest -> $src"
}

link "$REPO_DIR/.config/hypr"     "$HOME/.config/hypr"
link "$REPO_DIR/.config/hyprlock" "$HOME/.config/hyprlock"
link "$REPO_DIR/.config/waybar"   "$HOME/.config/waybar"
link "$REPO_DIR/.config/rofi"     "$HOME/.config/rofi"
link "$REPO_DIR/.config/fastfetch" "$HOME/.config/fastfetch"
link "$REPO_DIR/.zshrc"    "$HOME/.zshrc"
link "$REPO_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

mkdir -p "$HOME/Pictures/wallpapers"
cp "$REPO_DIR/wallpapers/wallhaven-lyde7l_2560x1440.png" "$HOME/Pictures/wallpapers/"
link "$HOME/Pictures/wallpapers/wallhaven-lyde7l_2560x1440.png" "$HOME/.current_wallpaper"

cat <<'EOF'

Done linking configs. Still needed:
  - Install the rice source repos listed in README.md into your home dir
    (HyprNova, Hyprlock-Dots, hyprzepyx, rofi, powerlevel10k)
  - Install packages: hyprland hyprlock waybar rofi fastfetch zsh kitty swaync mangohud
  - chsh -s $(which zsh)
EOF
