FROM tomcat:8.0.46-jre8
RUN groupadd -g 999 -r xl && useradd -u 999 --no-log-init -r -g xl xl
RUN chown -R xl:xl /usr/local/tomcat
RUN chmod -R 777 /usr/local/tomcat
USER 999

ENV JAVA_OPTS -Xmx512m -Djava.security.egd=file:/dev/./urandom
ARG PET_VERSION
ENV MY_PET_VERSION ${PET_VERSION}

RUN mkdir -p /usr/local/tomcat/conf/Catalina/localhost

COPY src/main/docker/petclinic.xml  /usr/local/tomcat/conf/Catalina/localhost/petclinic.xml
COPY src/main/docker/catalina.properties /usr/local/tomcat/conf/catalina.properties
COPY target/PetClinic.war /usr/local/tomcat/webapps/petclinic.war
CMD ["catalina.sh", "run"]
