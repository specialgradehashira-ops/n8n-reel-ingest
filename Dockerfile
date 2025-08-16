# n8n official image is Alpine-based -> use apk, not apt
FROM n8nio/n8n:latest

# install python, pip, ffmpeg, bash (needed by Execute Command), and yt-dlp
USER root
RUN apk add --no-cache \
      python3 \
      py3-pip \
      ffmpeg \
      bash \
      ca-certificates \
      curl \
 && pip3 install --no-cache-dir yt-dlp

# persist data and credentials on the mounted disk
ENV N8N_USER_FOLDER=/data
USER node
