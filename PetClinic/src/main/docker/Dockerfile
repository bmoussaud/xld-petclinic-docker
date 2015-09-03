FROM tomcat:8.0

COPY PetClinic.war /usr/local/tomcat/webapps/petclinic.war
RUN  mkdir -p /usr/local/tomcat/conf/Catalina/localhost
COPY petclinic.xml  /usr/local/tomcat/conf/Catalina/localhost/petclinic.xml
#ENV CATALINA_OPTS -Xmx1024m
ENV JAVA_OPTS -Xmx512m -Djava.security.egd=file:/dev/./urandom

CMD ["catalina.sh", "run"]
