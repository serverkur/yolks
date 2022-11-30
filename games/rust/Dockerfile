FROM 		--platform=$TARGETOS/$TARGETARCH quintenqvd/pterodactyl_images:installer_steamcmd

ENV         DEBIAN_FRONTEND=noninteractive

RUN         apt update \
			&& apt upgrade -y \
			&& apt install -y unzip curl iproute2 tzdata libgdiplus libsdl2-2.0-0:armhf lib32gcc-s1-amd64-cross \
			&& curl -sL https://deb.nodesource.com/setup_14.x | bash - \
			&& apt install -y nodejs \
			&& mkdir /node_modules \
			&& npm install --prefix / ws \
			&& useradd -d /home/container -m container


USER 		container
ENV  		USER=container HOME=/home/container

WORKDIR 	/home/container

COPY 		./entrypoint.sh /entrypoint.sh
COPY 		./wrapper.js /wrapper.js

CMD			[ "/bin/bash", "/entrypoint.sh" ]
