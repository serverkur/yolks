FROM      --platform=$TARGETOS/$TARGETARCH alpine:3.16

##    install dependencies
RUN   apk add --no-cache murmur curl wget git iproute2 fontconfig ca-certificates sqlite tar

RUN   adduser -D container

USER   container
ENV    USER=container HOME=/home/container
WORKDIR /home/container

COPY  ./entrypoint.sh /entrypoint.sh
CMD   ["/bin/ash", "/entrypoint.sh"]
