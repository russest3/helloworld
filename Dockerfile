FROM jboss/wildfly
EXPOSE 9990
EXPOSE 8081
ARG POM_ARTIFACTID
ENV POM_ARTIFACTID=${POM_ARTIFACTID}
ARG POM_VERSION
ENV POM_VERSION=${POM_VERSION}
USER root
VOLUME /app
RUN mkdir /app/$POM_ARTIFACTID-$POM_VERSION
COPY src/main/resources/application.properties /app/$POM_ARTIFACTID-$POM_VERSION/
COPY target/$POM_ARTIFACTID-$POM_VERSION.jar /app/$POM_ARTIFACTID-$POM_VERSION/
RUN chown -R jboss: /app
USER jboss
ENTRYPOINT java -Dapplication.properties=application.properties -jar helloworld-1.0.2-SNAPSHOT.jar