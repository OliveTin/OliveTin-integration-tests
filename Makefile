container:
	rm -rf *.tar.gz OliveTin-*
	mv dist/*.tar.gz ./
	tar xavf OliveTin-*linux-amd64.tar.gz
	docker rm -f olivetin && docker rmi -f olivetin
	docker build -t olivetin:latest OliveTin-*linux-amd64/
	docker create --name olivetin -p 1337:1337 -v `pwd`/config/:/config/ olivetin 

.PHONY: container
