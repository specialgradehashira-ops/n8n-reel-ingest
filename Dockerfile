# Render will build this image
FROM n8nio/n8n:latest

# Add python, pip, ffmpeg, yt-dlp
USER root
RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 python3-pip ffmpeg ca-certificates curl bash \
 && pip3 install --no-cache-dir yt-dlp \
 && rm -rf /var/lib/apt/lists/*

# persist n8n data & files in /data (Render Disk)
ENV N8N_USER_FOLDER=/data
USER node
