# NOTE: This Dockerfile contains logic for the API Gateway, but is located in the 
# analytics_service directory. Ensure you use the correct module path in your final setup.

FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /build
COPY . .
# FIX: Run 'install' across the entire multi-module project to ensure local dependencies 
# like 'common_security' are built and available in the container's Maven cache.
RUN mvn clean install -DskipTests

FROM eclipse-temurin:21-jdk-alpine
RUN adduser -S -D -H nonroot
WORKDIR /app
# Extract the packaged JAR from the build stage. We assume the API Gateway JAR 
# is packaged under its own directory after the 'install' command.
COPY --from=build /build/api_gateway/api_gateway/target/api_gateway-0.0.1-SNAPSHOT.jar /app/api_gateway-0.0.1-SNAPSHOT.jar
USER nonroot
# Expose the API Gateway port (9090)
EXPOSE 9090
ENTRYPOINT ["java", "-jar", "/app/api_gateway-0.0.1-SNAPSHOT.jar"]
# Set the server port to 9090
CMD ["--server.port=9090"]