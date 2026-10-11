#!/bin/sh

# 1. Jika sedang merekam, tombol PrtSc akan MENGHENTIKAN rekaman
if [ -f /tmp/screenrec.pid ]; then
    kill -INT $(cat /tmp/screenrec.pid)
    rm -f /tmp/screenrec.pid
    notify-send -t 3000 "✅ Perekaman Selesai" "Video MP4 disimpan ke Videos/Recordings"
    exit 0
fi

# 2. Mode Pintar: Klik untuk Full Layar, Tarik (Drag) untuk Region
# argumen -o memungkinkan slurp mendeteksi seluruh output (monitor) jika hanya diklik
GEOMETRY=$(slurp -o -b 1e1e2eaa -c 89b4fa -w 2)

# Batal jika user menekan ESC
if [ -z "$GEOMETRY" ]; then exit 1; fi

FILE="$HOME/Pictures/Screenshots/sc_$(date +%s).png"
mkdir -p ~/Pictures/Screenshots

# 3. Ambil Gambar
grim -g "$GEOMETRY" "$FILE"

if [ -f "$FILE" ]; then
    wl-copy < "$FILE"
    notify-send -i "$FILE" "📸 Screenshot Tersimpan" "Disalin ke clipboard"
    # Langsung buka editor Swappy
    swappy -f "$FILE"
fi
