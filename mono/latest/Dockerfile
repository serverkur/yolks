FROM         --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL       author="QuintenQVD" maintainer="josdekurk@gmail.com"

RUN         apt update \
            && apt -y upgrade
RUN         apt install -y fontconfig dirmngr iproute2 curl ca-certificates openssl git tar sqlite3         
RUN         apt update
RUN         apt install -y mono-complete libc6
RUN         useradd -m -d /home/container -s /bin/bash container
RUN         ln -s /home/container/ /nonexistent

USER container
ENV USER=container
ENV HOME=/home/container
WORKDIR /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]
