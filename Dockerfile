# NOTE: This file is currently at the path for 'analytics_service'.
# In a correct environment, this content should be in 'course_service/course_service/Dockerfile'.

FROM maven:3.9.6-eclipse-temurin-21 AS build
WORKDIR /build
COPY . .
# FIX: Changed the build command from single-module 'package' to workspace 'install'.
# This ensures all sibling modules (like common_security) are built and 
# installed into the container's local Maven repository, resolving 'Could not find artifact' errors.
RUN mvn clean install -DskipTests

FROM eclipse-temurin:21-jdk-alpine
RUN adduser -S -D -H nonroot
WORKDIR /app
# Extract the packaged JAR from the build stage for the specific service.
COPY --from=build /build/course_service/course_service/target/course-service-0.0.1-SNAPSHOT.jar /app/course-service-0.0.1-SNAPSHOT.jar
USER nonroot
# Expose the Course Service port (8083)
EXPOSE 8083
ENTRYPOINT ["java", "-jar", "/app/course-service-0.0.1-SNAPSHOT.jar"]
# Set the server port to 8083
CMD ["--server.port=8083"]