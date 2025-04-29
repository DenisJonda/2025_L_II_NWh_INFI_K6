deps:
	pip install -r requirements.txt
docker_build:
	docker build -t hello-world-printer .
docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 5000:5000 \
		-d hello-world-printer
docker_push: docker_build
	@docker login --username DyZioo --password Test123456; \
	docker tag dyzioo/hello-world-printer:latest; \
	docker push $(TAG); \
	docker logout;