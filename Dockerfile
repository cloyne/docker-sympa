FROM clonm/sympa

COPY ./etc /etc

RUN chown -R sympa:sympa /etc/sympa/sympa* && \
 chown -R sympa:sympa /var/lib/sympa && \
 chown -R sympa:sympa /etc/sympa/cloyne.org && \
 chown -R sympa:sympa /etc/sympa/conf.d

# upgrade nullmailer so we can use TLS1.3
RUN echo "deb http://archive.ubuntu.com/ubuntu focal main universe" >> /etc/sources.list && \
 echo "deb http://archive.ubuntu.com/ubuntu focal-updates main universe" >> /etc/sources.list && \
 echo "deb http://archive.ubuntu.com/ubuntu focal-backports main universe" >> /etc/sources.list && \
 echo "deb http://archive.ubuntu.com/ubuntu focal-security main universe" >> /etc/sources.list && \
 apt update && \
 apt-get --yes --force-yes --only-upgrade install nullmailer
