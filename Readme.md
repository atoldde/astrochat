# Chat with Mercure and Symfony

Descriptions of project here : https://blog.eleven-labs.com/fr/creez-un-chat-avec-symfony-et-mercure


## Commandes

* Init project :

```shell
docker compose pull && docker compose build
```

* Start project :

```shell
docker compose up -d
```

Go to http://localhost:83 to see your homepage.

* Install Vendors *(not necessary, already executed in Entrypoint)* :

```shell
docker compose exec -it php composer install
```

* Clear Symfony caches *(if needed)* :

```shell
docker compose exec -it php bin/console cache:clear
```

* Update BDD *(not necessary, already executed in Entrypoint)* :

```shell
docker compose exec -it php bin/console doctrine:migrations:migrate --no-interaction --allow-no-migration
```

* Create "test" channel (change "test" for another channel) :

```shell
docker compose exec -it php bin/console channel:create test
```

* Command line in PHP container :

```shell
docker compose exec -it php bash
```

* Stop project :

```shell
docker compose down
```
