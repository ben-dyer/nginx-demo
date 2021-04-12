.PHONY: r
r:
	docker-compose exec ben service nginx reload

.PHONY: u d ud
u:
	docker-compose up
d:
	docker-compose down
ud:
	docker-compose up -d
.PHONY: t
t:
	docker-compose run ben nginx -t

.PHONY: b
b:
	docker-compose run ben bash

.PHONY: index test fake
index: ud
	curl -i localhost:8013/index.html
test: ud
	curl -i localhost:8013/test.html
fake: ud
	curl -i localhost:8013/fake.html

.PHONY: sub side fakesub
sub: ud
	curl -i localhost:8013/sub/test.html
side: ud
	curl -i localhost:8013/side/test.html

fakesub: ud
	curl -i localhost:8013/fakesub/test.html