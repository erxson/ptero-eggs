FROM gcr.io/distroless/static-debian11

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates nginx openjdk-17-jre-headless nodejs python3 \
    php8.0 php8.0-xml php8.0-fpm php8.0-session php8.0-soap php8.0-openssl php8.0-gmp php8.0-pdo_odbc php8.0-json \
    php8.0-dom php8.0-pdo php8.0-zip php8.0-mysqli php8.0-sqlite3 php8.0-pdo-pgsql php8.0-bcmath php8.0-gd \
    php8.0-odbc php8.0-pdo-mysql php8.0-pdo-sqlite php8.0-gettext php8.0-xmlreader php8.0-bz2 php8.0-iconv \
    php8.0-pdo-dblib php8.0-curl php8.0-ctype php8.0-phar php8.0-fileinfo php8.0-mbstring php8.0-tokenizer \
    php8.0-simplexml

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

USER nobody:nogroup
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
