FROM gcr.io/distroless/static-debian11

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl ca-certificates nginx openjdk-17-jre-headless nodejs python3 \
    php8.0-common php8.0-gd php8.0-ldap php8.0-odbc php8.0-readline php8.0-sqlite3 php8.0-xsl \
    php8.0-apcu php8.0-curl php8.0-gmp php8.0-mailparse php8.0-opcache php8.0-redis php8.0-sybase php8.0-yac \
    php8.0-ast php8.0-dba php8.0-igbinary php8.0-mbstring php8.0-pgsql php8.0-rrd php8.0-tidy php8.0-yaml \
    php8.0-bcmath php8.0-dev php8.0-imagick php8.0-memcached php8.0-phpdbg php8.0-smbclient php8.0-uuid php8.0-zip \
    php8.0-bz2 php8.0-ds php8.0-imap php8.0-msgpack php8.0-pspell php8.0-snmp php8.0-xdebug php8.0-zmq \
    php8.0-cgi php8.0-enchant php8.0-interbase php8.0-mysql php8.0-psr php8.0-soap php8.0-xhprof \
    php8.0-cli php8.0-fpm php8.0-intl php8.0-oauth php8.0-raphf php8.0-solr php8.0-xml

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

USER nobody:nogroup
WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
