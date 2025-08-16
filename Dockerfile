# n8n on Alpine; keep it simple & robust for Render
FROM n8nio/n8n:latest

USER root

# ffmpeg for muxing, bash for Execute Command, curl to fetch yt-dlp
RUN apk update && apk add --no-cache \
      bash \
      ffmpeg \
      python3 \
      curl \
      ca-certificates \
      tzdata \
 && curl -L "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp" \
      -o /usr/local/bin/yt-dlp \
 && chmod a+rx /usr/local/bin/yt-dlp

# persist n8n data/credentials/downloads on Render disk
ENV N8N_USER_FOLDER=/data
# optional: set your timezone (or omit and run UTC)
# ENV TZ=America/New_York

USER node
