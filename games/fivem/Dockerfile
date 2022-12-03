FROM 		--platform=$TARGETOS/$TARGETARCH quintenqvd/pterodactyl_images:installer_steamcmd

ENV         DEBIAN_FRONTEND=noninteractive

RUN         apt update \
			&& apt upgrade -y \
			&& apt install -y unzip curl iproute2 tzdata libgdiplus libsdl2-2.0-0:armhf lib32gcc-s1-amd64-cross \
			&& apt install -y nodejs \
			&& useradd -d /home/container -m container


## install required packages
RUN     dpkg --add-architecture i386 \
        && apt update -y \
        && apt install -y --no-install-recommends gnupg2 tzdata wget software-properties-common libntlm0 winbind xvfb xauth python3
# Install winehq-stable and with recommends
RUN     wget -nc https://dl.winehq.org/wine-builds/winehq.key \
        && apt-key add winehq.key \
        && echo "deb https://dl.winehq.org/wine-builds/debian/ bullseye main" >> /etc/apt/sources.list \
        && wget -O- -q download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_11/Release.key | apt-key add - \
        && echo "deb http://download.opensuse.org/repositories/Emulators:/Wine:/Debian/Debian_11 ./" | tee /etc/apt/sources.list.d/wine-obs.list \
        && apt update \
		&& apt install -y --install-recommends winehq-staging cabextract

# Set up Winetricks
RUN	    wget -q -O /usr/sbin/winetricks https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks \
        && chmod +x /usr/sbin/winetricks

ENV     HOME=/home/container
ENV     WINEPREFIX=/home/container/.wine
ENV     WINEDLLOVERRIDES="mscoree,mshtml="
ENV     DISPLAY=:0
ENV     DISPLAY_WIDTH=1024
ENV     DISPLAY_HEIGHT=768
ENV     DISPLAY_DEPTH=16
ENV     AUTO_UPDATE=1
ENV     XVFB=1

USER    container
WORKDIR	/home/container

COPY 		./entrypoint.sh /entrypoint.sh

CMD			[ "/bin/bash", "/entrypoint.sh" ]
