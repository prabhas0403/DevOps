FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget
RUN mkdir /usr/local/tomcat
RUN wget http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.56/bin/apache-tomcat-8.5.56.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.56/* /usr/local/tomcat/
COPY hello-world-war/dist/hello-world.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run
#CMD /usr/local/tomcat/webapps
