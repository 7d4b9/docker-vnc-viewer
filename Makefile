VERSION ?= dev
IMAGE_TAG ?= $(VERSION)
IMAGE ?= vnc-viewer:$(IMAGE_TAG)

build:
	@docker build -t $(IMAGE) .
.PHONY: build

LOCAL_DISPLAY   = 0
VNC_SERVER_HOST = host.docker.internal:5900

CONTAINER_NAME = vnc-viewer-$(VERSION)

run:
	@-docker rm -f $(CONTAINER_NAME) 2>/dev/null
	@docker run --rm \
	-v /tmp/.X11-unix:/tmp/.X11-unix \
	-e DISPLAY=host.docker.internal:$(LOCAL_DISPLAY) -it \
	-e VNC_SERVER_HOST=$(VNC_SERVER_HOST) -it \
	--name $(CONTAINER_NAME) --entrypoint bash \
	$(IMAGE) 
.PHONY: run