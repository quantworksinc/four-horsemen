.PHONY: build push

build:
	docker build -t quantworks/four-horsemen:latest .

push:
	docker push quantworks/four-horsemen:latest
