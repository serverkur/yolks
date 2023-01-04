FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL       author="QuintenQVD" maintainer="josdekurk@gmail.com"

RUN         apt update \
			&& apt -y install curl tar bzip2 file wget\
            && wget https://dot.net/v1/dotnet-install.sh \
			&& mkdir -p /usr/share \
            && chmod +x dotnet-install.sh \
			&& ./dotnet-install.sh -i /usr/share -v 6.0.403 \
			&& ln -s /usr/share/dotnet /usr/bin/dotnet \
			&& apt -y install ffmpeg wget iproute2 git ca-certificates tzdata zip tar libtool \
			&& apt -y install libc6 libgcc1 libgssapi-krb5-2 libicu67 libssl1.1 libstdc++6 zlib1g libsdl2-2.0-0 libsdl2-dev \
			&& apt update -y \
			&& dotnet --info \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY   		 ./../entrypoint.sh /entrypoint.sh
CMD 		["/bin/bash", "/entrypoint.sh"] 
