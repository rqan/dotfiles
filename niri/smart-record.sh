#!/bin/sh

# 1. Jika sudah merekam, hentikan
if [ -f /tmp/screenrec.pid ]; then
    kill -INT $(cat /tmp/screenrec.pid)
    rm -f /tmp/screenrec.pid
    notify-send -t 3000 "✅ Perekaman Selesai" "Video MP4 disimpan ke Videos/Recordings"
    exit 0
fi

# 2. Mode Rekam Pintar
notify-send -t 2000 "🎥 Mode Rekam" "Klik untuk rekam full layar, atau tarik (drag) untuk region."
GEOMETRY=$(slurp -o -b 1e1e2eaa -c f38ba8 -w 2)

if [ -z "$GEOMETRY" ]; then exit 1; fi

FILE="$HOME/Videos/Recordings/rec_$(date +%s).mp4"
mkdir -p ~/Videos/Recordings

# 3. Mulai Merekam
wl-screenrec -g "$GEOMETRY" -f "$FILE" &
echo $! > /tmp/screenrec.pid

notify-send -t 3000 "🔴 Perekaman Berjalan" "Tekan tombol PrtSc kapan saja untuk berhenti merekam."
