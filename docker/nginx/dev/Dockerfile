FROM nginx

RUN apt-get update && apt-get install -y \
    mc

COPY nginx.conf /etc/nginx/
COPY app.conf /etc/nginx/sites-available/

RUN rm -f /etc/nginx/conf.d/default.conf
RUN mkdir /etc/nginx/sites-enabled -p
RUN ln -s /etc/nginx/sites-available/app.conf /etc/nginx/sites-enabled/app.conf
RUN rm -f /etc/nginx/sites-enabled/default.conf
RUN rm -f /etc/nginx/sites-available/default.conf

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data


CMD ["nginx"]

EXPOSE 80
EXPOSE 443
