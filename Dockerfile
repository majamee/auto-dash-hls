FROM        majamee/alpine-dash-hls:jpg-thumbnails

COPY        ./entrypoint.sh /bin/entrypoint.sh
RUN         chmod +x /bin/entrypoint.sh

ENTRYPOINT  ["/bin/entrypoint.sh",""]
WORKDIR     /video
