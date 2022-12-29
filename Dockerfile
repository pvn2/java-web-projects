# Pull base image
FROM tomcat:8-jre8

# Maintainer
MAINTAINER "venkat"

# copy war file on to container
COPY target/*.war /usr/local/tomcat/webapps
