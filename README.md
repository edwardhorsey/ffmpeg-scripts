# ffmpeg-scripts

## MOV to MP4 (automatic settings)
```
ffmpeg -i input.mov output.mp4
```


## Fixed time length (9 seconds)
```
ffmpeg -i input.mov -ss 00:00:0.0 -t 9 output.mp4
```

## MOV to GIF
```bash
ffmpeg \
    -i input.mov \
    -vf "fps=10,scale=500:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 \
    out.gif
```

## Compress MP4
```bash
# -an to remove audio, higher -crf equals more compression

ffmpeg \
    -i input.mp4 \
    -vcodec libx264 \
    -crf 26 \
    -an \
    -movflags faststart \
    output.mp4
```