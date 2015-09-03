FROM tomcat:8.0

COPY PetClinic-Backend.war /usr/local/tomcat/webapps/petclinic-backend.war
RUN  mkdir -p /usr/local/tomcat/conf/Catalina/localhost
COPY petclinic-backend.xml /usr/local/tomcat/conf/Catalina/localhost/petclinic-backend.xml

CMD ["catalina.sh", "run"]
