FROM tomcat:latest
LABEL "Project"="VProfile"
LABEL "Author"="Taiqp"
WORKDIR /usr/local/tomcat
RUN rm -rf /usr/local/tomcat/webapps/*
COPY ./target/vprofile-v2.war /usr/loca/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD ["catalina.sh", "run"]
VOLUME /usr/local/tomcat/webapps/logs/
