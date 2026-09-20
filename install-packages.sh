#!/usr/bin/env bash
set -euo pipefail

if [ ! -f /etc/os-release ] || ! grep -qiE '^ID(_LIKE)?=.*arch' /etc/os-release; then
  echo "This script installs packages with pacman/yay and is meant for Arch-based" \
       "distros (Arch, CachyOS, EndeavourOS, ...). Aborting." >&2
  exit 1
fi

OFFICIAL_PKGS=(
  hyprland hyprlock hyprshot hyprpolkitagent
  waybar rofi fastfetch
  zsh kitty dolphin
  swaync mangohud cava playerctl brightnessctl pamixer
  wl-clipboard cliphist wireplumber grim awww
  blueman kdeconnect network-manager-applet
  python python-evdev jq
  otf-geist-mono-nerd ttf-firacode-nerd
)

# waybar-cava (AUR) replaces the official 'waybar' package: same binary, built
# with the cava audio-visualizer module enabled, which this waybar config uses.
AUR_PKGS=(waybar-cava)

echo "==> Installing official repo packages..."
sudo pacman -S --needed --noconfirm "${OFFICIAL_PKGS[@]}"

if pacman -Qi waybar >/dev/null 2>&1 && ! pacman -Qi waybar-cava >/dev/null 2>&1; then
  echo "==> Removing plain 'waybar' so it doesn't conflict with 'waybar-cava'..."
  sudo pacman -R --noconfirm waybar
fi

if ! command -v yay >/dev/null 2>&1; then
  echo "==> yay not found, building it from AUR..."
  sudo pacman -S --needed --noconfirm base-devel git
  tmpdir="$(mktemp -d)"
  git clone https://aur.archlinux.org/yay.git "$tmpdir/yay"
  (cd "$tmpdir/yay" && makepkg -si --noconfirm)
  rm -rf "$tmpdir"
fi

echo "==> Installing AUR packages..."
yay -S --needed --noconfirm "${AUR_PKGS[@]}"

echo "==> All packages installed."
