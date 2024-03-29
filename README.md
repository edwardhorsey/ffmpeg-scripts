# FFMPEG scripts

A growing collection of commands that I use day-to-day.

## Video
### MOV to MP4 (automatic settings)
```bash
ffmpeg -i input.mov output.mp4

# scale to 800px width & automatic height
ffmpeg -i input.mov -vf scale=800:-1  output-800.mp4
```


### Fixed length (9 seconds)
```bash
ffmpeg -i input.mov -ss 00:00:0.0 -t 9 output.mp4
```

### MOV to GIF
```bash
ffmpeg \
    -i input.mov \
    -vf "fps=10,scale=500:-1:flags=lanczos,split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse" \
    -loop 0 \
    out.gif
```

### Compress MP4
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
## Images
### Compress folder of images
```bash
# higher -q:v equals more compression

mkdir processed
for f in *.jpg *.png *.jpeg
    do
        ffmpeg -i $f -q:v 10 processed/$f -y
    done

# webp
for f in *.png
    do
        cwebp -q 90 $f -o "${f%.png}.webp"
    done
```
## Audio
### Compress wav to mp3
```bash
i=FILENAME.wav

ffmpeg -i "$i" -ab 320k "${i%.*}.mp3"
```
