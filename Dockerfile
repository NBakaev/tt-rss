FROM lsiobase/nginx:3.10

RUN \
 echo "**** install packages ****" && \
 apk add --no-cache --upgrade \
	curl \
	git \
	grep \
	php7-apcu \
	php7-curl \
	php7-dom \
	php7-gd \
	php7-iconv \
	php7-intl \
	php7-ldap \
	php7-mcrypt \
	php7-mysqli \
	php7-mysqlnd \
	php7-pcntl \
	php7-pdo_mysql \
	php7-pdo_pgsql \
	php7-pgsql \
	php7-posix \
	tar && \
 echo "**** install software ****" && \
 git clone https://git.tt-rss.org/fox/tt-rss.git && mv tt-rss html && mv html /var/www && \
 mkdir -p /var/www/html/ && \
 echo "**** link php7 to php ****" && \
 ln -sf /usr/bin/php7 /usr/bin/php && \
 echo "**** cleanup ****" && \
 rm -rf \
	/tmp/*

# copy local files
COPY root/ /

# ports and volumes
EXPOSE 80 443
VOLUME /config
