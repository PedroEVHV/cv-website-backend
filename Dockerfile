# Build stage (using Maven to compile)
FROM maven:3.8.5-openjdk-17 AS build
WORKDIR /app
COPY src/main/java .
RUN mvn clean package -DskipTests

# Package stage (run the JAR with OpenJDK JRE)
FROM eclipse-temurin:17-jre-alpine
VOLUME /tmp
COPY --from=build /app/target/cv_backend-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 10000
ENTRYPOINT ["java", "-jar", "/app.jar"]
