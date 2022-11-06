FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL       author="QuintenQVD" maintainer="josdekurk@gmail.com"

RUN         apt update \
			&& apt -y install curl tar bzip2 file wget\
            && wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
            && dpkg -i packages-microsoft-prod.deb \
            && rm packages-microsoft-prod.deb \
            && apt update -y \
            && apt install -y dotnet-sdk-6.0 libgdiplus
			&& apt -y install ffmpeg wget iproute2 git ca-certificates tzdata zip tar libtool \
			&& apt -y install libc6 libgcc1 libgssapi-krb5-2 libicu67 libssl1.1 libstdc++6 zlib1g \
			&& apt update -y \
			&& dotnet --info \
            && useradd -m -d /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY   		 ./../entrypoint.sh /entrypoint.sh
CMD 		["/bin/bash", "/entrypoint.sh"] 
