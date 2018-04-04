FROM jboss/wildfly
EXPOSE 8080
EXPOSE 9990
EXPOSE 8081
USER root
RUN mkdir /app
COPY /var/jenkins_home/workspace/application.properties /app/
COPY /var/jenkins_home/workspace/target/helloworld-1.0.2-SNAPSHOT.jar /app/
RUN chown -R jboss: /app
USER jboss
VOLUME /app
RUN java -Dapplication.properties=/app/application.properties -jar /app/helloworld-1.0.2-SNAPSHOT.jar
