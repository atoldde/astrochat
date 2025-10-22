#!/bin/bash

cd /var/www/mercure-chat && composer install
php /var/www/mercure-chat/bin/console doctrine:migrations:migrate --no-interaction --allow-no-migration
php /var/www/mercure-chat/bin/console cache:clear
