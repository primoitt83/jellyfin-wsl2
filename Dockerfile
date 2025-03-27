## this is for debian bookworm 12.5
FROM jellyfin/jellyfin:10.9.6

ENV DEBIAN_FRONTEND=noninteractive

## install mesa
RUN \
    apt update && \
    apt install -y vainfo mesa-va-drivers mesa-vulkan-drivers vulkan-tools

ADD get-videos.sh /tmp
RUN \
    chmod +x /tmp/get-videos.sh