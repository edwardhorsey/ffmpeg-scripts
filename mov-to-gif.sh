# scale=500:-1 -> retain aspect ratio with 500px width

ffmpeg \
    -i input.mov \
    -vf "fps=10,scale=500:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 \
    cut-out-3-test-with-docker.gif