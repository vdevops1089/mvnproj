# maven

                                          Maven-Tomcat Deployment
                                         --------------------------------------
Step-1:  Tomcat Authentication : 
----------------------------------------------------
    # cd /opt/apache-tomcat-9.0.58/conf
    # vi tomcat-users.xml

<tomcat-users xmlns="http://tomcat.apache.org/xml"
              xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
              xsi:schemaLocation="http://tomcat.apache.org/xml tomcat-users.xsd"
              version="1.0">

 <role rolename="manager-gui"/>
  <role rolename="manager-script"/>
  <user username="admin" password="password" roles="manager-gui,manager-script"/>


</tomcat-users>


Step-2:  Maven Authentication:  
---------------------------------------------
        # cd /opt/apache-maven-3.8.4/conf
        # vi settings.xml

   <server>
      <id>mytom</id>
      <username>admin</username>
      <password>password</password>
    </server>


Step-3:  Tomcat7 maven plugin:  
---------------------------------------------
         # cd mvnproj
         # vi pom.xml

<plugin>
        <groupId>org.apache.tomcat.maven</groupId>
        <artifactId>tomcat7-maven-plugin</artifactId>
        <version>2.2</version>
        <configuration>
                <url>http://localhost:8080/manager/text</url>
                <server>mytom</server>
                <path>/myproj</path>
        </configuration>
</plugin>

Step-4 :  Deploy to Tomcat
---------------------------------------
Commands to manipulate WAR file on Tomcat.
# mvn compile
# mvn package
# mvn tomcat7:deploy 
# mvn tomcat7:undeploy 
# mvn tomcat7:redeploy 
    then you can check in  /opt/tomcat/webapps


   Browser https://localhost:8080/myproj


