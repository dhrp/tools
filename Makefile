image:
	docker buildx build -t dhrp/tools .

push:
	docker push dhrp/tools

all: build push
