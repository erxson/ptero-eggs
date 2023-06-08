FROM bitnami/minideb

RUN apt update && apt install -y lsb-release ca-certificates apt-transport-https software-properties-common gnupg2 wget
RUN echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/sury-php.list
RUN wget -qO - https://packages.sury.org/php/apt.gpg | apt-key add -
RUN apt update
RUN apt install -y \
    php8.0-fpm php8.0 php8.0-common php8.0-zip php8.0-xml \
    php8.0-tidy php8.0-sybase php8.0-sqlite3 php8.0-soap php8.0-snmp php8.0-readline \
    php8.0-pspell php8.0-odbc php8.0-mysql php8.0-mbstring php8.0-ldap php8.0-intl \
    php8.0-interbase php8.0-imap php8.0-gmp php8.0-gd php8.0-fpm php8.0-enchant \
    php8.0-dev php8.0-dba php8.0-curl php8.0-cli php8.0-cgi php8.0-bz2 php8.0-bcmath \
    nginx openjdk-17-jre-headless nodejs python3

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /home/container
COPY ./entrypoint.sh /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
