build-docker:
	docker build -t hello_world .
  	
run-docker:
	docker run -d --name=hello_world -p 8080:8080 hello_world

start-docker:
	docker start hello_world

stop-docker:
	docker stop hello_world

logs-docker:
	docker logs hello_world
  
rm-docker:
	docker rm hello_world