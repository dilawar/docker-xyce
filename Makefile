IMAGENAME=dilawars/xyce
TAG="7.4.0"

all : Dockerfile
	docker build -t $(IMAGENAME):$(TAG) .
	docker build -t $(IMAGENAME):latest .

test:
	docker run -it $(IMAGENAME):$(TAG) Xyce -h

upload:
	docker push $(IMAGENAME):$(TAG)
	docker push $(IMAGENAME):latest
