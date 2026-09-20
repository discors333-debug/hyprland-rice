# harri's Hyprland rice

Dotfiles for a Hyprland setup: Hyprland config, Hyprlock lockscreen, Waybar,
Rofi launcher, Fastfetch, and Zsh (with Powerlevel10k).

## What's in this repo

- `.config/hypr` — Hyprland config
- `.config/hyprlock` — Hyprlock lockscreen config
- `.config/waybar` — Waybar bar config (mirrors [my-waybar](https://github.com/discors333-debug/my-waybar))
- `.config/rofi` — Rofi launcher config
- `.config/fastfetch` — Fastfetch config
- `.zshrc`, `.p10k.zsh` — Zsh + Powerlevel10k shell config
- `wallpapers/` — the wallpaper used by hyprlock/hyprpaper

## Dependencies not included here

These configs reference themes/scripts that were originally set up from other
people's repos. Clone them too, into your home directory:

- https://github.com/zDyant/HyprNova (`~/HyprNova`)
- https://github.com/mahaveergurjar/Hyprlock-Dots (`~/Hyprlock-Dots`)
- https://github.com/xZepyx/HyprZepyx (`~/hyprzepyx`)
- https://github.com/adi1090x/rofi (`~/rofi`)
- https://github.com/romkatv/powerlevel10k (`~/powerlevel10k`)

You'll also need these packages installed (via `pacman`/`yay` on Arch/CachyOS):
`hyprland`, `hyprlock`, `waybar`, `rofi`, `fastfetch`, `zsh`, `kitty` (or your
terminal of choice), `swaync`, `MangoHud`.

## Install

```sh
git clone <this-repo-url> ~/dotfiles
cd ~/dotfiles
./install.sh
```

`install.sh` symlinks the config folders and files into place and copies the
wallpaper. It backs up anything that already exists at the destination with a
`.bak` suffix before overwriting it.

After installing, set zsh as your shell if it isn't already:

```sh
chsh -s $(which zsh)
```
