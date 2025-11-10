
* Run n8n in docker
docker volume create n8n_data_old
docker run -it --rm --name n8n -p 5678:5678 -v n8n_data_old:/home/node/.n8n docker.n8n.io/n8nio/n8n


# MAIN DOCKER COMPOSE COMMANDS  
* Bring up N8N via docker compose:  
docker-compose -f n8n-compose-http.yml up -d
docker-compose -f n8n-compose-https.yml up -d

* Rebuild a single existing service:  
docker-compose -f n8n-compose-http.yml up -d --no-deps --build --force-recreate n8n
docker-compose -f n8n-compose-https.yml up -d --no-deps --build --force-recreate n8n

* Stop services configured in docker-compose configuration file:  
docker-compose -f n8n-compose-http.yml down
docker-compose -f n8n-compose-https.yml down


