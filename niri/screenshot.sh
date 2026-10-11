#!/bin/sh
mkdir -p ~/Pictures/Screenshots
FILE="$HOME/Pictures/Screenshots/sc_$(date +%s).png"

# Slurp dengan warna overlay gelap & border Catppuccin Blue
GEOMETRY=$(slurp -b 1e1e2eaa -c 89b4fa -w 2)

if [ -n "$GEOMETRY" ]; then
    grim -g "$GEOMETRY" "$FILE"
    if [ -f "$FILE" ]; then
        wl-copy < "$FILE"
        notify-send -i "$FILE" "Screenshot Tersimpan" "Disalin ke clipboard & disimpan di Pictures/Screenshots"
        # Buka di Swappy (Editor ala macOS/Serpantinum)
        swappy -f "$FILE"
    fi
fi
