FROM        --platform=$TARGETOS/$TARGETARCH ubuntu:focal

LABEL       author="oliver194" maintainer="100048880+oliver194@users.noreply.github.com"

LABEL       org.opencontainers.image.source="https://github.com/oliver194/yolks"
LABEL       org.opencontainers.image.licenses=MIT

ENV         DEBIAN_FRONTEND=noninteractive

RUN         apt update \
		&& apt upgrade -y \
		&& apt -y --no-install-recommends install ca-certificates curl git unzip zip tar jq
