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
	@docker login --username $DyZioo --password $$Ksawery6879!@; \
	docker tag hello-world-printer $(TAG); \
	docker push $(TAG); \
	docker logout;