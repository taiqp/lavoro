#Writen by Taiqp
System has 02 main modules: App & MySQL. There are also a Memcached & a RabbitMQ to support.
Therefore, we need to run 05 components: Nginx - Tomcat for App - Memcached - RabbitMQ - MySQL.

For the Memcached & RabbitMQ, we just need to pull available images to deploy on proper ports.
However, for MySQLDB, we need to import db_import.sql, so 01 Dockerfile. And of course, we need to build Docker Image for App using Tomcat image.
We don't need to use Nginx as a gateway, because Kubernetes LoadBalancer will help us this service.

- Dockerfile DB (taiqp/vprofiledb): using image mysql:8.0.30, port 3306, mount directory of db_import.sql to /docker-entrypoint-initdb.d, so it automatically runs.
- Dockerfile App (taiqp/vprofileapp): using image tomcat:latest to run, copy artifact file Vprofile-v1.war into and run catalina.sh
