FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

RUN         apt update -y \
						&& apt install -y curl ca-certificates openssl git tar gnupg sqlite3 fontconfig tzdata iproute2 libfreetype6 \
						&& useradd -d /home/container -m container

# add zulu key
RUN        apt-key adv \
            --keyserver hkp://keyserver.ubuntu.com:80 \
            --recv-keys 0xB1998361219BD9C9

# add zulu repo
RUN         curl -sSL -o zulu.deb https://cdn.azul.com/zulu/bin/zulu-repo_1.0.0-3_all.deb \
            && apt install -y ./zulu.deb \
            && apt update

# install java
RUN         apt install -y zulu8-jdk

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./../entrypoint.sh /entrypoint.sh
CMD         [ "/bin/bash", "/entrypoint.sh" ]