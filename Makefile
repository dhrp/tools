full:
	docker buildx build -f Dockerfile.full -t dhrp/tools -t dhrp/tools:full --load .

slim:
	docker buildx build -t dhrp/tools:slim --load .

publish-full:
	docker buildx build -f Dockerfile.full -t dhrp/tools -t dhrp/tools:full --platform=linux/amd64,linux/arm64 --push .

publish-slim:
	docker buildx build -t dhrp/tools:slim --platform=linux/amd64,linux/arm64 --push .

publish: publish-slim publish-full

run:
	docker run -it --rm -p 8000:8000 dhrp/tools

all: publish
