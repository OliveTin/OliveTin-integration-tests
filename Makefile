default:
	rm *.tar.gz 
	mv dist/* ./
	tar xavf OliveTin-*linux-amd64.tar.gz
	docker build -t olivetin:latest OliveTin-*linux-amd64/
	docker start olivetin:latest
  
