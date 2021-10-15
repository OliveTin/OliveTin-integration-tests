default:
	rm -rf *.tar.gz 
	mv dist/* ./
	tar xavf OliveTin-*linux-amd64.tar.gz
	docker rm -f olivetin
	docker build -t olivetin:latest OliveTin-*linux-amd64/
	docker create --name olivetin -v config.yaml:/config/ olivetin 
	docker start olivetin
  
