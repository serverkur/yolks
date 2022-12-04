FROM        --platform=$TARGETOS/$TARGETARCH node:16.18.0-alpine3.16

RUN apk add --no-cache chromium iproute2 curl tar tzdata git

ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser \
  DOCKER=true

RUN adduser -D -h /home/container container

USER 		container
ENV  		USER=container HOME=/home/container
WORKDIR 	/home/container

COPY 		./entrypoint.sh /entrypoint.sh

CMD			[ "/bin/ash", "/entrypoint.sh" ]
