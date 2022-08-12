FROM maven:3.8.6-openjdk-8 as builder
LABEL "Author"="Taiqp"
COPY ./ /usr/src/mymaven/
WORKDIR /usr/src/mymaven
RUN mvn install

FROM tomcat:8-jre11
WORKDIR /user/local/tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT*
COPY --from=builder /usr/src/mymaven/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
