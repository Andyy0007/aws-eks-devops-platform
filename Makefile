test:
	python3 -m pytest -q

docker-build:
	docker build -t anadi07/flaskapp:latest .

compose-up:
	docker compose up --build

helm-lint:
	helm lint ./helm/flask-app

terraform-validate:
	cd terraform && terraform fmt -recursive && terraform validate
