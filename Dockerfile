FROM webdevops/php-nginx:8.0

ADD .docker/nginx.conf /opt/docker/etc/nginx/vhost.conf
ADD ./app /var/www/html

RUN composer install --no-dev -d /var/www/html -n

RUN cd /usr/sbin/ && ln -s /var/www/html/vendor/drush/drush/drush drush