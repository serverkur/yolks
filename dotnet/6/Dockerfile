FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

LABEL       author="QuintenQVD" maintainer="josdekurk@gmail.com"

RUN         apt update \
			&& apt -y install curl tar bzip2 file \
            && curl -Lo dotnet-sdk-arm64.tar.gz https://download.visualstudio.microsoft.com/download/pr/a567a07f-af9d-451a-834c-a746ac299e6b/1d9d74b54cf580f93cad71a6bf7b32be/dotnet-sdk-6.0.401-linux-arm64.tar.gz \   
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
