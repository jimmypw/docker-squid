PWD := $(shell pwd)

build:
	docker build -t jimmypw/squid .

run:
	docker run -it -p 8080:8080 -v ${PWD}/etc:/squid/etc:z -v ${PWD}/logs:/squid/var/logs:z -v ${PWD}/cache:/squid/var/cache/squid:z jimmypw/squid

debug:
	docker run -p 8080:8080 -v ${PWD}/etc:/squid/etc:z -v ${PWD}/logs:/squid/var/logs:z -v ${PWD}/cache:/squid/var/cache/squid:z --entrypoint=/bin/bash -it jimmypw/squid

push:
	docker push jimmypw/squid
