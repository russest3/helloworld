FROM jboss/wildfly
EXPOSE 8080
EXPOSE 9990
EXPOSE 8081
USER root
RUN mkdir /app
RUN mkdir /app/$POM_ARTIFACTID-$POM_VERSION
COPY src/main/resources/application.properties /app/$POM_ARTIFACTID-$POM_VERSION/
COPY target/$POM_ARTIFACTID-$POM_VERSION.jar /app/$POM_ARTIFACTID-$POM_VERSION/
RUN chown -R jboss: /app
USER jboss
VOLUME /app
RUN java -Dapplication.properties=/app/$JOB_NAME-$VERSION/application.properties -jar /app/$POM_ARTIFACTID-$POM_VERSION/$POM_ARTIFACTID-$POM_VERSION.jar
