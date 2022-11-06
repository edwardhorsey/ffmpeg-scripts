# -an to remove audio

ffmpeg \
    -i input.mp4 \
    -vcodec libx264 \
    -crf 26 \
    -an \
    -movflags faststart \
    output.mp4