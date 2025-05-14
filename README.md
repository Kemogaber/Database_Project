# How to run
```shell
docker-compose up -d
docker-compose exec -it db mysql -ppassword
```

**Note:** On some systems, you may need to replace `docker-compose` with `docker compose`.

**Note:** On some systems, you may need to run as `root` so use `sudo docker-compose` or `sudo docker compose`.

## Metabase

In advanced options put
`allowPublicKeyRetrieval=true`

# How to stop
```shell
docker-compose down
```