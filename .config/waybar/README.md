# my-waybar

My personal [Waybar](https://github.com/Alexays/Waybar) configuration for Hyprland.

## Features

- Hyprland workspaces, clock (with calendar tooltip), network, and tray modules
- Pulseaudio volume with a slider module and click-to-open `pavucontrol`
- Custom media widget (`media.sh`) showing the current player via `playerctl`
- A bank of extra custom modules (`ModulesCustom.txt`) for things like weather,
  power menu, notifications (SwayNC), updates, and separators

## Requirements

- [Waybar](https://github.com/Alexays/Waybar)
- [Hyprland](https://hyprland.org/)
- `playerctl` (for the media module)
- `pavucontrol` (for the pulseaudio click action)
- A Nerd Font (icons use glyphs from GeistMono/FiraCode Nerd Font)

## Installation

Clone this repo into `~/.config/waybar`:

```bash
git clone https://github.com/<your-username>/my-waybar.git ~/.config/waybar
```

Then restart Waybar:

```bash
killall waybar; waybar &
```

## Files

- `config.jsonc` — main Waybar module layout and config
- `style.css` — theming/styling
- `media.sh` — script backing the `custom/media` module
- `ModulesCustom.txt` — extra custom module definitions to copy into your config as needed

## Credits

`ModulesCustom.txt` is adapted from [JaKooLit's Hyprland-Dots](https://github.com/JaKooLit).
