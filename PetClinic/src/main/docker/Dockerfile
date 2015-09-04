FROM tomcat:8.0


COPY PetClinic.war /usr/local/tomcat/webapps/petclinic.war
RUN  mkdir -p /usr/local/tomcat/conf/Catalina/localhost
COPY petclinic.xml  /usr/local/tomcat/conf/Catalina/localhost/petclinic.xml
ENV JAVA_OPTS -Xmx512m -Djava.security.egd=file:/dev/./urandom
COPY catalina.properties /usr/local/tomcat/conf/catalina.properties

CMD ["catalina.sh", "run"]
