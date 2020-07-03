FROM alpine:latest
MAINTAINER Andrew Dacey <adacey@gmail.com>
# Basic defautls for user
ENV 	UID 99
ENV 	GID 100
ENV	USER putio
# Setup directories
ENV	HOME /config
RUN	mkdir -p $HOME
# Setup user
RUN 	addgroup -g $GID -S users && adduser \
	--disabled-password \
	--gecos "" \
	--home "$HOME" \
	--ingroup "users" \
	--no-create-home \
	--uid "$UID" \
	"$USER"
# Install basic dependencies
RUN	apk update && apk upgrade && apk add --no-cache \
	bash \
	python \
	py-pip
RUN	pip install --no-cache-dir putio-automator
USER	$USER
RUN	cp /usr/share/putio-automator/config.py.dist /config/config.py
RUN	mkdir -p /files/incomplete
ADD	putio.sh /usr/bin/putio.sh
WORKDIR /config
VOLUME 	["/config","/files/downloads","/files/torrents","/files/incomplete"]
ENTRYPOINT 	["putio.sh"]
