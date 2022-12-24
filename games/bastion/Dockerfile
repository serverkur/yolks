FROM        --platform=$TARGETOS/$TARGETARCH mongo:6-focal

## install nodejs 18
RUN apt install -y curl \ 
 && curl -fsSL https://deb.nodesource.com/setup_18.x -o setup_18.sh && chmod +x setup_18.sh \
 && ./setup_18.sh \
 && rm setup_18.sh \
 && apt install -y nodejs \
 && npm install -g npm@latest \
 ## install bastion reqs
 && apt install -y python3 build-essential git libtool netcat ffmpeg iproute2 \
 ## add container user
 && useradd -d /home/container -m container -s /bin/bash

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/bash", "/entrypoint.sh"]
