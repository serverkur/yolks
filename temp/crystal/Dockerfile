FROM         --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

ENV          DEBIAN_FRONTEND noninteractive

LABEL       author="QuintenQVD" maintainer="josdekurk@gmail.com"

RUN         apt update \
            && apt -y upgrade

RUN         apt install -y fontconfig dirmngr iproute2 curl ca-certificates gnupg ffmpeg openssl git tar sqlite3 apt-transport-https libc6 \     
            && apt update \
            && curl -fsSL https://crystal-lang.org/install.sh | bash -s -- --channel=stable --version=latest \
            && apt install -y libssl-dev libxml2-dev libyaml-dev libgmp-dev libz-dev

RUN          useradd -m -d /home/container -s /bin/bash container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
