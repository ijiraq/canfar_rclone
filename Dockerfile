# Use a lightweight base image
FROM alpine:3.20

# Install rclone and ca-certificates (needed for SSL handshakes)
RUN apk add --no-cache rclone ca-certificates bash

# Expose port 5000 as strictly required by CANFAR's contributed kind
EXPOSE 5000

# Create an incoming directory inside the user's home / scratch area 
# (Note: CANFAR mounts your actual /arc and /scratch storage at runtime)
RUN mkdir -p /tmp/incoming

# Set up the exact rclone webdav command listening on port 5000
# --baseurl "/" strips the proxy suffix so rclone accepts raw traffic at the root level

ENTRYPOINT ["/bin/bash", "-c", "/arc/home/jkavelaars/launch_rclone.sh"]
