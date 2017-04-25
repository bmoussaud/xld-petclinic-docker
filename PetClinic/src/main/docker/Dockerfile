FROM tomcat:8.0.37-jre8-alpine

RUN  mkdir -p /usr/local/tomcat/conf/Catalina/localhost
COPY petclinic.xml  /usr/local/tomcat/conf/Catalina/localhost/petclinic.xml
ENV JAVA_OPTS -Xmx512m -Djava.security.egd=file:/dev/./urandom
COPY catalina.properties /usr/local/tomcat/conf/catalina.properties

COPY maven/ROOT.war /usr/local/tomcat/webapps/petclinic.war

CMD ["catalina.sh", "run"]
