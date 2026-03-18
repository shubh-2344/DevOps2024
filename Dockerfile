# Pull base image 
From tomcat:9

# Maintainer 
MAINTAINER "shubhamtakalikar1@gmail.com" 
COPY ./webapp.war /usr/local/tomcat/webapps
