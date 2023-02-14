BASH_SHELL := $(shell which bash)
SHELL := $(BASH_SHELL)
APP_CONDA_ENV_NAME ?= base

default:

.PHONY: stop_jupyterlab
stop_jupyterlab:
	docker-compose -f ./docker/jupyterlab/docker-compose.yaml stop || true

.PHONY: start_jupyterlab
start_jupyterlab: stop_jupyterlab
	docker-compose -f ./docker/jupyterlab/docker-compose.yaml up -d
	echo Access JupyterLab: http://localhost:28888
