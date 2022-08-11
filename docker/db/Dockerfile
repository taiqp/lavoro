FROM mysql:latest

LABEL "Project"="Lavoro"
LABEL "Author"="Taiqp"

ENV MYSQL_ROOT_PASSWORD="vprodbpass"
ENV MYSQL_DATABASE="accounts"


ADD db_import.sql docker-entrypoint-initdb.d/db_import.sql
