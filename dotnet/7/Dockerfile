FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL       author="QuintenQVD" maintainer="josdekurk@gmail.com"

RUN         apt update \
			&& apt -y install curl tar bzip2 file \
            && curl -Lo dotnet-sdk-arm64.tar.gz https://download.visualstudio.microsoft.com/download/pr/620a7215-63f9-47bb-b88a-7798e958ed2d/539a8c04045ab69efa77504f75f07a23/dotnet-sdk-7.0.100-rc.1.22431.12-linux-arm64.tar.gz \   
            && echo $PATH \
            && mkdir -p /usr/share/dotnet \
			&& tar -zxf dotnet-sdk-arm64.tar.gz -C /usr/share/dotnet \
			&& rm dotnet-sdk-arm64.tar.gz \
            && ln -s /usr/share/dotnet/dotnet /usr/bin/dotnet \
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
