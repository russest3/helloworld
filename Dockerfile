FROM jboss/wildfly
EXPOSE 8080
EXPOSE 9990
EXPOSE 8081
USER root
RUN mkdir /app
RUN mkdir /app/$JOB_NAME-$VERSION
COPY $WORKSPACE/src/main/resources/application.properties /app/$JOB_NAME-$VERSION/
COPY $WORKSPACE/target/$JOB_NAME-$VERSION.jar /app/$JOB_NAME-$VERSION/
RUN chown -R jboss: /app
USER jboss
VOLUME /app
RUN java -Dapplication.properties=/app/$JOB_NAME-$VERSION/application.properties -jar /app/$JOB_NAME-$VERSION/$JOB_NAME-$VERSION.jar
