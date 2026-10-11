#!/bin/sh
mkdir -p ~/Videos/Recordings
FILE="$HOME/Videos/Recordings/rec_$(date +%s).mp4"
PID_FILE="/tmp/screenrec.pid"

if [ -f "$PID_FILE" ]; then
    # Jika sedang merekam, hentikan
    kill -INT $(cat "$PID_FILE")
    rm "$PID_FILE"
    notify-send -t 3000 "Perekaman Selesai" "Video MP4 berhasil disimpan ke Videos/Recordings"
else
    # Jika belum merekam, pilih area dan mulai
    notify-send -t 2000 "Memulai Perekaman" "Silakan pilih/tarik area layar yang ingin direkam..."
    GEOMETRY=$(slurp -b 1e1e2eaa -c f38ba8 -w 2) # Border merah
    
    if [ -n "$GEOMETRY" ]; then
        wl-screenrec -g "$GEOMETRY" -f "$FILE" &
        echo $! > "$PID_FILE"
        notify-send -t 3000 "Perekaman Berjalan" "Tekan shortcut yang sama lagi untuk berhenti."
    fi
fi
