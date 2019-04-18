# Collector IST docker compose for development

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