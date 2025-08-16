# ---- n8n + yt-dlp for Instagram Reels (Render) ----
# Base: n8n (Alpine). Use apk, not apt-get.
FROM n8nio/n8n:latest

USER root

# Refresh index, install runtime deps, then yt-dlp via pip
RUN apk update && apk add --no-cache \
      python3 \
      py3-pip \
      ffmpeg \
      bash \
      curl \
      ca-certificates \
      tzdata \
  && pip3 install --no-cache-dir --upgrade pip \
  && pip3 install --no-cache-dir yt-dlp \
  && ln -sf /usr/bin/python3 /usr/bin/python

# Persist n8n data/credentials/files to Render disk
ENV N8N_USER_FOLDER=/data

# (Optional) set timezone; otherwise n8n runs in UTC
# ENV TZ=America/New_York

USER node
