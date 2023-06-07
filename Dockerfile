FROM gcr.io/distroless/static-debian11

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates nginx openjdk-17-jre-headless nodejs python3 \
    php8 php8-xml php8-fpm php8-session php8-soap php8-openssl php8-gmp php8-pdo_odbc php8-json \
    php8-dom php8-pdo php8-zip php8-mysqli php8-sqlite3 php8-pdo_pgsql php8-bcmath php8-gd \
    php8-odbc php8-pdo_mysql php8-pdo_sqlite php8-gettext php8-xmlreader php8-bz2 php8-iconv \
    php8-pdo_dblib php8-curl php8-ctype php8-phar php8-fileinfo php8-mbstring php8-tokenizer \
    php8-simplexml

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

USER nobody:nogroup
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
