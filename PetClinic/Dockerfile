FROM tomcat:8.0.37-jre8-alpine
RUN addgroup xebialabs && adduser -HD petclinic && adduser petclinic xebialabs
RUN chown -R petclinic:xebialabs /usr/local/tomcat
USER petclinic
ENV JAVA_OPTS -Xmx512m -Djava.security.egd=file:/dev/./urandom
RUN  mkdir -p /usr/local/tomcat/conf/Catalina/localhost

COPY src/main/docker/petclinic.xml  /usr/local/tomcat/conf/Catalina/localhost/petclinic.xml
COPY src/main/docker/catalina.properties /usr/local/tomcat/conf/catalina.properties
COPY target/PetClinic.war /usr/local/tomcat/webapps/petclinic.war
CMD ["catalina.sh", "run"]
