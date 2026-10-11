# Dotfiles

Personal desktop configuration files for NixOS / Hyprland / Niri / Shell environments.

## Included Configurations
- `hypr`: Hyprland configuration, infinite desktop script (`scripts/infinite_desktop_core.py`), shaders, and utils.
- `hyprland`: Secondary / fallback Hyprland config.
- `niri`: Niri scrollable-tiling Wayland compositor config and helper scripts.
- `caelestia`: Caelestia shell configuration.
- `fish`: Fish shell configuration and functions.
- `foot`: Foot Wayland terminal emulator config.
- `kitty`: Kitty terminal configuration.
- `fastfetch`: Fastfetch system information display config.
- `fuzzel`: Fuzzel application launcher config.
- `starship.toml`: Starship cross-shell prompt config.
- `cava`: Cava audio visualizer configuration.
- `btop`: btop resource monitor configuration.

## Installation / Sync on Target NixOS Machine

Clone this repository and copy the configs into `~/.config/`:

```bash
git clone https://github.com/rqan/dotfiles.git ~/dotfiles

# Copy all configurations to ~/.config
cp -r ~/dotfiles/hypr ~/.config/
cp -r ~/dotfiles/hyprland ~/.config/
cp -r ~/dotfiles/niri ~/.config/
cp -r ~/dotfiles/caelestia ~/.config/
cp -r ~/dotfiles/fish ~/.config/
cp -r ~/dotfiles/foot ~/.config/
cp -r ~/dotfiles/kitty ~/.config/
cp -r ~/dotfiles/fastfetch ~/.config/
cp -r ~/dotfiles/fuzzel ~/.config/
cp -r ~/dotfiles/cava ~/.config/
cp -r ~/dotfiles/btop ~/.config/
cp ~/dotfiles/starship.toml ~/.config/
```
