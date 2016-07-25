FROM debian

RUN apt-get update && apt-get install -y \
	vim \
	curl \
	wget \
	git \
	make \
	netcat \
	python \
	g++	

COPY . /src/
