FROM debian:bullseye-slim as build

RUN dpkg --add-architecture armhf && \
    apt-get update && \
    apt-get install --yes --no-install-recommends git  python3 build-essential cmake ca-certificates && \
    apt-get install --yes --no-install-recommends gcc-arm-linux-gnueabihf libc6-dev-armhf-cross libc6:armhf libstdc++6:armhf && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/{apt,dpkg,cache,log} /tmp/* /var/tmp/*

RUN git clone https://github.com/ptitSeb/box86.git; mkdir /box86/build

WORKDIR /box86/build
RUN cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo && \
    make -j$(nproc) && \
    make install DESTDIR=/tmp/install

FROM        --platform=$TARGETOS/$TARGETARCH debian:bullseye-slim

COPY --from=build /tmp/install /

RUN dpkg --add-architecture armhf && \
    apt-get update && \
    apt-get install --yes --no-install-recommends libc6:armhf libstdc++6:armhf gcc-arm-linux-gnueabihf libc6:armhf libncurses5:armhf libsdl2-image-2.0-0:armhf && \
    apt-get -y autoremove && \
    apt-get clean autoclean && \
    rm -rf /tmp/* /var/tmp/* /var/lib/apt/lists
			
ENV         DEBIAN_FRONTEND=noninteractive

RUN         dpkg --add-architecture armhf \
				&& apt update \
				&& apt upgrade -y \
				&& apt -y --no-install-recommends install ca-certificates curl git wget

RUN         apt install -y libc6:armhf libncurses5:armhf libsdl2*:armhf libopenal*:armhf libpng*:armhf libfontconfig*:armhf libXcomposite*:armhf libbz2-dev:armhf libXtst*:armhf 

##Install box64
RUN         wget https://ryanfortner.github.io/box64-debs/box64.list -O /etc/apt/sources.list.d/box64.list \
            && wget -O- https://ryanfortner.github.io/box64-debs/KEY.gpg | gpg --dearmor | tee /usr/share/keyrings/box64-debs-archive-keyring.gpg \
            && apt update && apt install box64 -y
			
ENV     STEAMOS=1
ENV     STEAM_RUNTIME=1
