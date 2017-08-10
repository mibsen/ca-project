build: 
	docker build --rm --pull -t "ca-project" .

local: 
	-docker rm -f "ca-project-local"
	docker run --rm -d -p 6891:5000 --name "ca-project-local" ca-project 

staging: 
	-docker rm -f "ca-project-staging"
	docker run --rm -d -p 6892:5000 --name "ca-project-staging" ca-project 

production: 
	-docker rm -f "ca-project-production"
	docker run --rm -d -p 6893:5000 --name "ca-project-production" ca-project 

test:
	docker run --rm ca-project python tests.py 

clean:
	-docker rm -f "ca-project-local"
	-docker rm -f "ca-project-staging"
	-docker rm -f "ca-project-production"
	-docker rmi -f "ca-project"

all: build test local