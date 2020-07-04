FROM alpine:3.4
MAINTAINER Andrew Dacey <adacey@gmail.com>
# Basic defautls for user
ENV 	UID 99
ENV	USER putio
# Setup directories
ENV	HOME /config
# Setup user
RUN 	adduser \
	-D \
	-g "" \
	-h "$HOME" \
	-G "users" \
	-u "$UID" \
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
