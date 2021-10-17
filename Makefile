container:
	rm -rf *.tar.gz 
	mv dist/*.tar.gz ./
	tar xavf OliveTin-*linux-amd64.tar.gz
	docker rm -f olivetin && docker rmi -f olivetin
	docker build -t olivetin:latest OliveTin-*linux-amd64/
	docker create --name olivetin -p 1337:1337 -v `pwd`/config/:/config/ olivetin 

cypress:
	npm install
	cp -f /config/config.{general,}.yaml
	docker start olivetin
	NO_COLOR=1 ./node_modules/.bin/cypress run --headless -c baseUrl=http://localhost:1337 || true
	docker kill olivetin
		

.PHONY: cypress container
