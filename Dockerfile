FROM bitnami/pgpool:4.3.1

MAINTAINER michimau <mauro.michielon@eea.europa.eu>

USER root
RUN apt-get -y update && \
    apt-get -y install \
    supervisor
ADD etc/supervisord.d/*.ini /etc/supervisord.d/
ADD loop_healthcheck.sh /opt/bitnami/scripts
RUN mkdir -p /var/log/supervisor && \
    chown 1001:1001 /var/log/supervisor && \
    touch /supervisord.log && \
    chown 1001:1001 /supervisord.log

RUN tac /opt/bitnami/scripts/pgpool/entrypoint.sh | sed '1 a /opt/bitnami/scripts/pgpool/setup.sh' | tac > /opt/bitnami/scripts/pgpool/entrypoint2.sh && \
    mv /opt/bitnami/scripts/pgpool/entrypoint2.sh /opt/bitnami/scripts/pgpool/entrypoint.sh && \
    chmod a+x /opt/bitnami/scripts/pgpool/entrypoint.sh
RUN cat /opt/bitnami/scripts/pgpool/entrypoint.sh
USER 1001

ENTRYPOINT [ "/opt/bitnami/scripts/pgpool/entrypoint.sh" ]

CMD [ "/usr/bin/supervisord", "-c", "/etc/supervisord.d/apps.ini" ]
