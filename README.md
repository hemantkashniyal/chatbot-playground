# chatbot-playground

## Setup Steps

### Setup Repo

- checkout project
- run `git submodule update --init --recursive`

---

### Run Rasa Chatbot

- move to base of the repository
- run following command to train a model (in case of new clone or whenever training is needed)
  ```
  docker run -it -v $(pwd)/rasa:/app rasa/rasa:latest-full train
  ```
- once training is complete run following command to start a rasa server
  ```
  docker-compose -f ./docker/rasa/docker-compose.yaml up -d
  ```
- wait for all servises to be up and running
- open the file in your browser [bot-client/demo.html](bot-client/demo.html)
- interact with chatbot
- more details on training chatbot is in [Rasa Docs](https://rasa.com/docs/rasa/)

---

### Run Jupyterlab

- move to base of the repository
- run following command
  ```
  make start_jupyterlab
  ```
- access at [http://localhost:28888](http://localhost:28888)

---

## Create a new python application in `chatbot` monorepo

- move to `<repo_base>/chatbot` directory
- run `nvm use`
- run `yarn install`
- run following command to create an application
  ```
  npx nx generate @nxlv/python:project <app-name> --type application --description=<app-description> --packageName=<app-package-name> --moduleName=<app-module-name>
  ```
  e.g.
  ```
  nx generate @nxlv/python:project chatbot_backend --type application --description='Chatbot Backend' --packageName=chatbot-backend --moduleName=chatbot_backend  --dry-run
  ```
- run following command to create a library
  ```
  npx nx generate @nxlv/python:project <lib-name> --type library --description=<lib-description> --packageName=<lib-package-name> --moduleName=<lib-module-name>
  ```
  e.g.
  ```
  nx generate @nxlv/python:project data-processing --type library --description='Data Processing Library' --packageName=chatbot-data-processing --moduleName=chatbot_data_processing  --dry-run
  ```
- more can be found [here](https://betterprogramming.pub/poetry-python-nx-monorepo-5750d8627024)
