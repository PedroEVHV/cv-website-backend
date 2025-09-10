# Build stage
FROM maven:3.9.9-eclipse-temurin-21 AS build
WORKDIR /app
# Copy pom.xml first to leverage Docker cache for dependencies
COPY pom.xml ./
RUN mvn dependency:go-offline -B
# Copy the rest of the project
COPY src ./src
RUN mvn clean package -DskipTests

# Package stage
FROM eclipse-temurin:21-jre-alpine
VOLUME /tmp
COPY --from=build /app/target/cv-backend-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 10000
# Render assigns a dynamic port; expose a placeholder
ENTRYPOINT ["java", "-jar", "/app.jar"]
