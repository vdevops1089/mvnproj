FROM tomcat:8.0
COPY index.html /usr/local/tomcat/webapps/ROOT/index.html
COPY /var/lib/jenkins/workspace/PROJECT1/target/myproj.war /usr/local/tomcat/webapps/myproj.war
ENV JAVA_HOME=/usr/bin/java
WORKDIR /usr/local/tomcat/webapps
USER  root
EXPOSE 8080
CMD ['catalina.sh','run']
