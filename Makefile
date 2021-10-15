default:
	rm -rf *.tar.gz 
	mv dist/*.tar.gz ./
	tar xavf OliveTin-*linux-amd64.tar.gz
	docker rm -f olivetin && docker rmi -f olivetin
	docker build -t olivetin:latest OliveTin-*linux-amd64/
	docker create --name olivetin -p 1337:1337 -v `pwd`/config/:/config/ olivetin 
	docker start olivetin
  
cypress:
	npm install
	cypress run --headless -c baseurl=http://localhost:1337
