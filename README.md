# Collector IST docker compose for development

Start application

```
docker-commpose up
npm start
```

Stop application

```
docker-compose down
```

## Loading dump file

You need to define the `DUMP_SOTIS_FILE` environment variable

```bash
export DUMP_SOTIS_FILE=/path/to/dump/file
```

And then uncomment the volume mapping for the mongo container, so that the volumes configuration ends up like the following:
```yaml
mongo:
  container_name: mongo-sotis
  ...
  volumes:
    - "$PWD/entrypoint.sh:/docker-entrypoint-initdb.d/entrypoint.sh"
    - "$DUMP_SOTIS_FILE:/dump/sotis.gz"
  ...
```

## Other docker commands

List Docker CLI commands
```
docker
docker container --help
```

Display Docker version and info
```
docker --version
docker version
docker info
```

Execute Docker image
```
docker run hello-world
```

List Docker images
```
docker image ls
```

List Docker containers (running, all, all in quiet mode)
```
docker container ls
docker container ls --all
docker container ls -aq
```
