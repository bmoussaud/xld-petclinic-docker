FROM tomcat:8.0.37-jre8-alpine

RUN  mkdir -p /usr/local/tomcat/conf/Catalina/localhost

COPY petclinic-backend.xml /usr/local/tomcat/conf/Catalina/localhost/petclinic-backend.xml
COPY maven/ROOT.war  /usr/local/tomcat/webapps/petclinic-backend.war

CMD ["catalina.sh", "run"]
