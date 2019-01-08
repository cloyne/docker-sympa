FROM clonm/sympa

COPY ./etc /etc

RUN chown -R sympa:sympa /etc/sympa/sympa* && \
 chown -R sympa:sympa /var/lib/sympa && \
 chown -R sympa:sympa /etc/sympa/cloyne.org && \
 chown -R sympa:sympa /etc/sympa/conf.d
