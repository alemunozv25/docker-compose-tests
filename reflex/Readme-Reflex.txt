
Testing example app from https://reflex.dev/docs/getting-started/introduction/ + https://reflex.dev/docs/getting-started/installation/

mkdir app1
cd app1


reflex init
───────────────────────────────────────────────────────────────────────────────────── Initializing app1 ──────────────────────────────────────────────────────────────────────────────────────
[09:52:23] Initializing the web directory.                                                                                                                                      console.py:231

Get started with a template:
(0) A blank Reflex app.
(1) Try our free AI builder.
(2) Premade templates built by the Reflex team.
Which template would you like to use? (0): 0
[09:52:26] Initializing the app directory.                                                                                                                                      console.py:231
Success: Initialized app1 using the blank template.

Go into app1 folder where the example python code was created.
1. edit rxconfig.py (still under folder app1) and include the frontend and backend ports of interest:
    app_name="app1",
    frontend_port=8010,
    backend_port=8020,

2. change directory to app1 (you should be now under folder app1/app1) and the files/folders listed should be "__init__.py" "__pycache__" and "app1.py"
replace app1.py with a new version with the code example included in https://reflex.dev/docs/getting-started/introduction/


-> Run the reflex app: 
reflex run 
────────────────────────────────────────────────────────────────── Starting Reflex App ──────────────────────────────────────────────────────────────────
[11:56:58] Compiling: ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ 100% 21/21 0:00:00
────────────────────────────────────────────────────────────────────── App Running ──────────────────────────────────────────────────────────────────────
App running at: http://localhost:8010/
Backend running at: http://0.0.0.0:8020
^C[11:57:08] Reflex app stopped.                                                                                                             console.py:231


To activate extended logging run reflex with --loglevel option:
reflex run --loglevel debug


*******
Running as a dockerized app

in the previous folder (app1) create the additional necessary files indicated in https://reflex.dev/blog/2024-10-8-self-hosting-reflex-with-docker/
compose.yaml
frontend.Dockerfile
backend.Dockerfile
nginx.conf

To make sure that no previous configuration is reused and show debugging information to the console, the following command can be used: 
docker compose down && docker compose build --progress=plain --no-cache && docker compose up
OR simplified way
docker compose build --progress=plain --no-cache && docker compose up


the normal way to bring up the containers using docker-compose is:
. Start services configured in docker-compose configuration file 
docker-compose -f compose.yaml up -d

.Rebuild a single existing service:
docker-compose -f compose.yaml up -d --no-deps --build --force-recreate frontend
docker-compose -f compose.yaml up -d --no-deps --build --force-recreate backend
docker-compose -f compose.yaml up -d --no-deps --build --force-recreate redis



*****
Checking Redis using Redis-cli
# redis-cli -h redis -p 6379
redis:6379> INFO keyspace
# Keyspace
redis:6379> CONFIG GET databases
1) "databases"
2) "16"
redis:6379> SET mykey "Hello world"
OK
redis:6379> GET mykey
"Hello world"
redis:6379> INFO keyspace
# Keyspace
db0:keys=1,expires=0,avg_ttl=0,subexpiry=0
redis:6379>




