CURR_DIR := $(shell pwd)
BASH_SHELL := $(shell which bash)
SHELL := $(BASH_SHELL)
APP_CONDA_ENV_NAME ?= base

default:

.PHONY: git-submodule-update
git-submodule-update:
	git submodule update --init --recursive

.PHONY: train
train:
	docker run --rm -it -v $(CURR_DIR):/app rasa/rasa:latest-full train

.PHONY: shell
shell:
	docker run --rm -it -v $(CURR_DIR):/app rasa/rasa:latest-full shell

.PHONY: kill
kill:
	docker-compose -f ../docker/rasa/docker-compose.yaml down

.PHONY: serve
serve: git-submodule-update kill
	docker-compose -f ../docker/rasa/docker-compose.yaml up -d
	echo Access Client: file://$(CURR_DIR)/../bot-client/demo.html


