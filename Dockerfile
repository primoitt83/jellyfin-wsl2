## this is for debian bookworm 12.5
FROM jellyfin/jellyfin:latest

ENV DEBIAN_FRONTEND=noninteractive

## install dependencies
RUN \
    apt update && \
    apt install -y wget curl gpg

## install mesa=23.2.1 from jammy repo
RUN \
    mkdir -p /etc/apt/keyrings && \    
    wget -qO- "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x871920D1991BC93C" | gpg --dearmor -o /etc/apt/keyrings/ubuntu-jammy.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/ubuntu-jammy.gpg] http://archive.ubuntu.com/ubuntu jammy main restricted universe multiverse" | tee /etc/apt/sources.list.d/ubuntu-jammy.list && \
    echo "deb [signed-by=/etc/apt/keyrings/ubuntu-jammy.gpg] http://archive.ubuntu.com/ubuntu/ jammy-updates main restricted universe multiverse" | tee /etc/apt/sources.list.d/ubuntu-jammy-updates.list && \
    echo "deb [signed-by=/etc/apt/keyrings/ubuntu-jammy.gpg] http://archive.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse" | tee /etc/apt/sources.list.d/ubuntu-jammy-security.list && \
    echo "deb [signed-by=/etc/apt/keyrings/ubuntu-jammy.gpg] http://archive.ubuntu.com/ubuntu/ jammy-backports main restricted universe multiverse" | tee /etc/apt/sources.list.d/ubuntu-jammy-backports.list && \
    apt update && \
    apt install -y vainfo mesa-va-drivers=23.2.1-1ubuntu3.1~22.04.3 && \
    apt install -y mesa-vulkan-drivers=23.2.1-1ubuntu3.1~22.04.3 && \
    apt install -y vulkan-tools=1.3.204.0+dfsg1-1

ADD get-videos.sh /tmp

RUN \
    chmod +x /tmp/get-videos.sh