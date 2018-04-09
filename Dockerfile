FROM jboss/wildfly
EXPOSE 8080
EXPOSE 9990
EXPOSE 8081
ARG POM_ARTIFACTID
ARG POM_VERSION
USER root
VOLUME /app
RUN mkdir /app/$POM_ARTIFACTID-$POM_VERSION
ADD src/main/resources/application.properties /app/$POM_ARTIFACTID-$POM_VERSION/
ADD target/$POM_ARTIFACTID-$POM_VERSION.jar /app/$POM_ARTIFACTID-$POM_VERSION/
RUN chown -R jboss: /app
USER jboss
ENTRYPOINT ["java", "-Dapplication.properties=/app/$POM_ARTIFACTID-$POM_VERSION/application.properties", "/app/$POM_ARTIFACTID-$POM_VERSION/$POM_ARTIFACTID-$POM_VERSION.jar"]