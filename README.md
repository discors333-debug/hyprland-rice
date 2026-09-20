# harri's Hyprland rice

Everything needed to turn a fresh Arch-based install (Arch, CachyOS, etc.)
into a copy of my Hyprland desktop: packages, configs, external rice
sources, and the custom window-navigation scripts.

## Prerequisites

- An Arch-based distro already installed (e.g. CachyOS via its Calamares
  installer), with a working internet connection.
- A regular user with `sudo` access (don't run any of this as root).
- `git` installed (`sudo pacman -S git` if it isn't already).

## Quick start

```sh
git clone https://github.com/discors333-debug/hyprland-rice ~/dotfiles
cd ~/dotfiles
./setup.sh
```

`setup.sh` runs everything below in order. It's safe to re-run if it fails
partway through — each step skips work that's already done.

When it finishes:

```sh
chsh -s $(which zsh)
```

then **log out and back in** (this applies the new shell and a group
membership the desktop scripts need), and pick **Hyprland** as the session
at your login/display manager.

## What setup.sh does, step by step

If you'd rather run things manually or something fails, here's each piece:

### 1. `install-packages.sh` — installs everything from pacman/AUR

Installs `hyprland`, `hyprlock`, `waybar-cava` (an AUR build of Waybar with
the cava audio-visualizer module baked in — this replaces the plain
`waybar` package, don't install both), `rofi`, `fastfetch`, `zsh`, `kitty`,
`dolphin`, `swaync`, `mangohud`, `cava`, `playerctl`, `brightnessctl`,
`pamixer`, `wl-clipboard`, `cliphist`, `wireplumber`, `grim`, `hyprshot`,
`hyprpolkitagent`, `awww`, `blueman`, `kdeconnect`,
`network-manager-applet`, `python`, `python-evdev`, `jq`, and two Nerd
Fonts (`otf-geist-mono-nerd`, `ttf-firacode-nerd`).

It installs `yay` first (building it from the AUR) if you don't already
have an AUR helper, since `waybar-cava` isn't in the official repos.

> **`awww`, not `swww`** — the wallpaper daemon and its `awww img ...` /
> `awww-daemon` commands are a real package called `awww` ("An Answer to
> your Wayland Wallpaper Woes"), not a typo of the similarly-named `swww`.
> Don't substitute one for the other.

### 2. `clone-rice-sources.sh` — clones the actual rice/theme repos

The Hyprland/Hyprlock look and the Rofi launcher styles were originally
built from other people's public dotfiles repos, not written from scratch.
This clones them straight from their sources into your home directory
(skipping any that already exist):

- [HyprNova](https://github.com/zDyant/HyprNova) → `~/HyprNova`
- [Hyprlock-Dots](https://github.com/mahaveergurjar/Hyprlock-Dots) → `~/Hyprlock-Dots`
- [HyprZepyx](https://github.com/xZepyx/HyprZepyx) → `~/hyprzepyx`
- [adi1090x/rofi](https://github.com/adi1090x/rofi) → `~/rofi`
- [powerlevel10k](https://github.com/romkatv/powerlevel10k) → `~/powerlevel10k` (the zsh prompt theme)

### 3. `install.sh` — symlinks the actual configs into place

Symlinks this repo's `.config/hypr`, `.config/hyprlock`, `.config/waybar`,
`.config/rofi`, `.config/fastfetch`, `.zshrc`, and `.p10k.zsh` into your
home directory, and installs the wallpaper. Anything already at those
paths gets renamed to `<path>.bak.<timestamp>` first — nothing is deleted.

### 4. `install-infinite-desktop.sh` — window navigation scripts

Several keybinds in `.config/hypr/hyprland.lua` (workspace switching,
floating/tiled toggle, directional window navigation and movement) call
Python scripts that live in `~/scripts/`, from a separate project,
[hyprland-infinitie-desktop-v2](https://github.com/sarodscommits/hyprland-infinitie-desktop-v2).
This script downloads that project and installs its scripts into
`~/scripts/`, and adds your user to the `input` group (required by
`python-evdev`, which those scripts use to read raw input — this is why a
logout/login is needed afterward).

It will also try to patch `hyprland.lua` with the same keybinds, but since
this repo's `hyprland.lua` already has them, it'll print a harmless
"already installed before" warning and skip that part.

## Keybind reference (mainMod = SUPER)

| Keybind | Action |
|---|---|
| `SUPER + Q` | Open terminal (kitty) |
| `SUPER + E` | Open file manager (dolphin) |
| `SUPER + SPACE` | App launcher (rofi) |
| `SUPER + ESCAPE` | Lock screen (hyprlock) |
| `SUPER + M` | Power menu (hyprshutdown if installed, else exit Hyprland) |
| `SUPER + A` | Screenshot region (hyprshot) |
| `SUPER + R` | Wallpaper picker |
| `SUPER + N` | Terminal running `claude` |
| `SUPER + D` | Toggle floating/tiled (all windows) |
| `SUPER + arrow keys` | Navigate windows |
| `SUPER + ALT + arrow keys` | Move tiled window |
| `SUPER + SHIFT + arrow keys` | Move floating window |
| `SUPER + CTRL + arrow keys` | Resize window |
| `SUPER + Z` / `SUPER + X` | Previous / next workspace |
| `SUPER + SHIFT + Z` / `X` | Move window to previous / next workspace |
| Volume/brightness/media keys | Handled via `wpctl`, `brightnessctl`, `playerctl` |

## Troubleshooting

- **Waybar shows no bars/modules, or won't start** — make sure
  `waybar-cava` is installed instead of plain `waybar` (`pacman -Qi
  waybar-cava`); having both installed conflicts.
- **Window-navigation keybinds do nothing** — you likely need to log out
  and back in after `install-infinite-desktop.sh` runs, for the `input`
  group membership to take effect.
- **Wallpaper picker (`SUPER + R`) fails** — confirm `awww` is installed
  and `awww-daemon` is running (it's started automatically by
  `hyprland.lua` on login).
- **Fonts look wrong in Waybar** — confirm the Nerd Fonts installed
  (`otf-geist-mono-nerd`, `ttf-firacode-nerd`); log out/in or run
  `fc-cache -f` after installing.
