PWD := $(shell pwd)

build:
	docker build -t jimmypw/squid .

run:
	docker run -it -p 3128:3128 -v ${PWD}/etc:/squid/etc:z -v ${PWD}/logs:/squid/var/logs:z -v ${PWD}/cache:/squid/var/cache/squid:z jimmypw/squid

debug:
	docker run -p 3128:3128 -v ${PWD}/etc:/squid/etc:z -v ${PWD}/logs:/squid/var/logs:z -v ${PWD}/cache:/squid/var/cache/squid:z --entrypoint=/bin/bash -it jimmypw/squid

push:
	docker tag jimmypw/squid:latest jimmypw/squid:4.7
	docker push jimmypw/squid:latest
	docker push jimmypw/squid:4.7
