# docker-vnc-viewer

Use the *docker-vnc-viewer* to view a local VNC server on a local X display using docker.

## Requirements

* Docker
* GNU Make

## Build

```bash
make build
```

## RUN

By default the *docker-vnc-viewer* will display on local display `:0` from port `5900` of a docker host machine (your desktop).

```bash
make run
```

is the same that: 

```bash
export VNC_SERVER_HOST=5900
export LOCAL_DISPLAY=0
make run
```