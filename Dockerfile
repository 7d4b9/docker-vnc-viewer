FROM debian:bookworm
RUN apt-get update && apt-get install -y xtightvncviewer
ARG vnc_server_host=host.docker.internal:5900
CMD vncviewer -fullscreen ${vnc_server_host}