FROM        majamee/alpine-dash-hls:webvtt-mt

COPY        ./entrypoint.sh /bin/entrypoint.sh
RUN         chmod +x /bin/entrypoint.sh

ENTRYPOINT  ["/bin/entrypoint.sh",""]
WORKDIR     /video
