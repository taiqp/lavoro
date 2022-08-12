#This for the Configuration if using Maven to build. Instead, using Jenkins to build makes it differently.
#FROM maven:3.8.6-openjdk-8 as builder
#LABEL "Author"="Taiqp"
#COPY ./ /usr/src/mymaven/
#WORKDIR /usr/src/mymaven
#RUN mvn install

FROM tomcat:8-jre11
LABEL "Author"="Taiqp"
WORKDIR /user/local/tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT*
COPY target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
#COPY --from=builder /usr/src/mymaven/target/vprofile-v2.war /usr/local/tomcat/webapps/ROOT.war
