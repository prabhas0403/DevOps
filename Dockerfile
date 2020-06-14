FROM ubuntu:latest
RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install openjdk-8-jdk wget unzip
RUN mkdir /usr/local/tomcat
RUN wget http://apachemirror.wuchna.com/tomcat/tomcat-8/v8.5.56/bin/apache-tomcat-8.5.56.tar.gz -O /tmp/tomcat.tar.gz
RUN cd /tmp && tar xvfz tomcat.tar.gz
RUN cp -Rv /tmp/apache-tomcat-8.5.56/* /usr/local/tomcat/
RUN wget https://www.michael-thomas.com/tech/apache/tomcat/tutorial_firststeps_tomcat/mytomcat-helloworld-war.zip
RUN unzip mytomcat-helloworld-war.zip
COPY mytomcat-helloworld.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run

