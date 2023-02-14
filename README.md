# chatbot-playground

## Setup Steps
### Setup Repo
* checkout project
* run `git submodule update --init --recursive`
---
### Run Rasa Chatbot
* move to base of the repository
* run following command to train a model (in case of new clone or whenever training is needed)
  ```
  docker run -it -v $(pwd)/rasa:/app rasa/rasa:latest-full train
  ```
* once training is complete run following command to start a rasa server
  ```
  docker-compose -f ./docker/rasa/docker-compose.yaml up -d
  ```
* wait for all servises to be up and running
* open the file in your browser [bot-client/demo.html](bot-client/demo.html)
* interact with chatbot
* more details on training chatbot is in [Rasa Docs](https://rasa.com/docs/rasa/)

---
### Run Jupyterlab
* move to base of the repository
* run following command
  ```
  make start_jupyterlab
  ```
* access at [http://localhost:28888](http://localhost:28888)

