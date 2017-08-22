FROM tomcat:8.0.46-jre8
RUN groupadd -g 999 -r xl && useradd -u 999 --no-log-init -r -g xl xl
RUN chown -R xl:xl /usr/local/tomcat
RUN chmod -R 777 /usr/local/tomcat

USER 999

ENV JAVA_OPTS -Xmx512m -Djava.security.egd=file:/dev/./urandom
RUN mkdir -p /usr/local/tomcat/conf/Catalina/localhost

COPY src/main/docker/petclinic-backend.xml /usr/local/tomcat/conf/Catalina/localhost/petclinic-backend.xml
COPY target/PetClinic-Backend.war  /usr/local/tomcat/webapps/petclinic-backend.war

CMD ["catalina.sh", "run"]
