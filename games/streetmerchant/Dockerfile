FROM        --platform=$TARGETOS/$TARGETARCH node:16-slim

ENV         DEBIAN_FRONTEND=noninteractive

RUN         apt update \
            && apt -y install ffmpeg iproute2 git sqlite3 libsqlite3-dev python3 python3-dev ca-certificates dnsutils tzdata zip tar curl build-essential libtool \
            && npm -g install npm@latest \
			&& npm -g install typescript \
            && useradd -m -d /home/container container

RUN     apt update \
        && apt install -y chromium-browser ca-certificates fonts-liberation libappindicator3-1 libasound2 libatk-bridge2.0-0 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgbm1 libgcc1 libglib2.0-0 libgtk-3-0 libnspr4 libnss3 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 lsb-release wget xdg-utils


USER 		container
ENV  		USER=container HOME=/home/container
ENV         PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=1
ENV         PUPPETEER_EXECUTABLE_PATH='/usr/bin/chromium-browser'
WORKDIR 	/home/container

COPY 		./entrypoint.sh /entrypoint.sh

CMD			[ "/bin/bash", "/entrypoint.sh" ]
