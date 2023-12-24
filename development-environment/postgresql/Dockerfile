FROM postgres:15.3

USER root

RUN mkdir -p /opt/postgres/data /scripts /tmp

RUN chown -R 999:999 /opt/postgres/data
RUN chown -R 999:999 /scripts
RUN chown -R 999:999 /tmp

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB backstagedb
ENV PGDATA /opt/postgres/data
