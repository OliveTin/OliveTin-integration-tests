container:
	rm -rf *.tar.gz 
	mv dist/*.tar.gz ./
	tar xavf OliveTin-*linux-amd64.tar.gz
	docker rm -f olivetin && docker rmi -f olivetin
	docker build -t olivetin:latest OliveTin-*linux-amd64/
	docker create --name olivetin -p 1337:1337 -v `pwd`/config/:/config/ olivetin 
	docker start olivetin
  
cypress:
	npm install
	NO_COLOR=1 ./node_modules/.bin/cypress run --headless -c baseUrl=http://localhost:1337 || true

.PHONY: cypress container
