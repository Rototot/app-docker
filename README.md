Docker for web application (Nginx + PHP-fpm)

## Stack
 - PHP7.1-fpm
 - Nginx
 - Postgresql 9.5+,
 - RabbitMQ
 - Redis

## Install
- copy .env.dist to .env 
- edit .env for your application
- run
```bash
make install
make run
```