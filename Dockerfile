FROM        majamee/alpine-dash-hls

RUN         apk add --no-cache --update ffmpeg bash && rm -rf /var/cache/apk/*
COPY        ./entrypoint.sh /bin/entrypoint.sh
RUN         chmod +x /bin/entrypoint.sh

ENTRYPOINT  ["/bin/entrypoint.sh",""]
WORKDIR     /video
