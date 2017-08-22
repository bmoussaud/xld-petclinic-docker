FROM tomcat:8.0.37-jre8-alpine

RUN addgroup xebialabs && adduser -HD petclinic && adduser petclinic xebialabs
RUN chown -R petclinic:xebialabs /usr/local/tomcat
USER petclinic
ENV JAVA_OPTS -Xmx512m -Djava.security.egd=file:/dev/./urandom
RUN  mkdir -p /usr/local/tomcat/conf/Catalina/localhost

COPY src/main/docker/petclinic-backend.xml /usr/local/tomcat/conf/Catalina/localhost/petclinic-backend.xml
COPY target/PetClinic-Backend.war  /usr/local/tomcat/webapps/petclinic-backend.war

CMD ["catalina.sh", "run"]
