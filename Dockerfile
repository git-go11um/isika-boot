FROM openjdk:21-slim
COPY target/*.jar app.jar
EXPOSE 8980
ENTRYPOINT ["java","-jar","/app.jar"]