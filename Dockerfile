FROM webdevops/php-nginx:8.0

ADD .docker/nginx.conf /opt/docker/etc/nginx/vhost.conf
# ADD .docker/docker-entrypoint.sh /etc/nginx/docker-entrypoint.sh
ADD ./app /var/www/html

RUN composer install --no-dev -d /var/www/html -n