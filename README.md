# Content Management System (CMS)-Project:Microservices Architecture (Dockerized)

/*Author :Simon Gawar*/
 Project Phase 1: Canonical Data Model [Mod 6]

This repository contains the setup for a Course Management System (CMS) implemented using five independent Spring Boot microservices, each connected to its own dedicated MySQL database. The entire environment is containerized using Docker and managed via Docker Compose.

1. Content management system Project Structure
The project root (CMS-Project/) contains the orchestration file (docker-compose.yml) and subdirectories for each service, following a double-nested structure for the application code.

CMS-Project/
├── docker-compose.yml              <-- Orchestrates entire environment
|
├── user-service/
│   └── user-service/               <-- Service Root (Contains Dockerfile, pom.xml, src/)
│       └── Dockerfile
|
├── course-service/
│   └── course-service/             <-- Service Root (Contains Dockerfile, pom.xml, src/)
│       └── Dockerfile
|
├── assessment-service/
│   └── assessment-service/         <-- Service Root (Contains Dockerfile, pom.xml, src/)
│       └── Dockerfile
|
├── notification-service/
│   └── notification-service/       <-- Service Root (Contains Dockerfile, pom.xml, src/)
│       └── Dockerfile
|
└── analytics-service/
    └── analytics-service/          <-- Service Root (Contains Dockerfile, pom.xml, src/)
        └── Dockerfile

2.Prerequisites
To build and run this CMS-project, you need the following installed:

Java Development Kit (JDK) 21: Required to build the Spring Boot applications.

Maven or Gradle: Required to execute the clean package commands to generate the JAR files.

Docker & Docker Compose: Required to build the container images and run the multi-container environment.

3.Deployment Guide: Containerization
Step 3.1: Build Executable JAR Files
The first step is to compile the Java code and package each service into an executable JAR file.

Action: Navigate into each service's root folder (user-service/user-service/) and run the build command:

Example for user-service

cd user-service/user-service/
./mvnw clean package -DskipTests

The JAR file is generated in the 'target/' folder

Repeat this process for all five services.

Step 3.2: Create and Run Docker Containers
The docker-compose.yml file handles building the images and starting the containers for all applications and databases.

Action: Navigate back to the main project root (CMS-Project/) where the docker-compose.yml file is located and run:

This command builds the images, starts all 10 containers (5 apps + 5 DBs), and runs them in the background (-d)

docker compose up -d

Verification: Check the status of all running containers:

docker ps

You should see 10 containers running (5 applications, 5 databases).

Step 3.3: Checking Logs for each service
To ensure a service started correctly and connected to its database, check its logs:

docker logs <service_name>

Example

docker logs analytics-service

Look for the standard Spring Boot startup message indicating that the service is running on internal port 8080.

4.Service Access and Testing (from Localhost)
Each service runs on a unique port on your host machine, as defined in the docker-compose.yml file (e.g., 8081:8080).

You can test connectivity to each service using the specified localhost port:

Service Name

Host Port

Database Container

Sample Access URL (Base)

user-service

8081

user-db

<http://localhost:8081/api/users>

course-service

8082

course-db

<http://localhost:8082/api/courses>

assessment-service

8083

assessment-db

<http://localhost:8083/api/assessments>

notification-service

8084

notification-db

<http://localhost:8084/api/notifications>

analytics-service

8085

analytics-db

<http://localhost:8085/api/analytics>

Database Access (Optional)
When we need to connect to the databases directly (like MySQL Workbench used here ), use the following credentials.

Parameter

Value

Host

localhost

Port

3306 (Only user-db is exposed here)

Username

root

Password

root@2025db

5.Cleanup
To stop and remove all containers, networks, and volumes created by Docker Compose, run the following command from the project root:

Stops and removes containers and networks (retains volumes)

docker compose down

To also remove the data volumes (for a clean restart)

docker compose down --volumes


Project Phase 2: Security [Mod 11]

Overview
This project enhances a microservices-based system with JWT-based security using Spring Cloud Gateway. The API Gateway validates JWT tokens and forwards authenticated user information to downstream services.

Technologies Used
-Spring Boot 3.5+
-Spring Cloud Gateway
-JWT (JSON Web Tokens)
-Postman
-Maven

Microservices
-User Service – `http://localhost:8081`
-Course Service – `http://localhost:8082`
-Assessment Service – `http://localhost:8083`
-Analytics Service – `http://localhost:8084`
-Notification Service – `http://localhost:8085`

## Setup Instructions

1.Clone the Repository
``bash
git clone https://github.com/simongawar/CMS-Project.git
cd SFWE 510 Cloud Native\CMS-Project

2.Run Microservices
Each microservice can be started using:
``bash
./mvnw spring-boot:run
``
Ensure ports `8081` to `8085` are available.

3.Run API Gateway
Navigate to the API Gateway module and run:
``bash
./mvnw spring-boot:run

Gateway runs on port `8080`.

JWT Authentication

Token Generation
Use the login endpoint (e.g., `/api/auth/login`) to generate a JWT token.

**Request:**
``http
POST /api/auth/login
Content-Type: application/json

{
  "username": "user1",
  "password": "password"
}
``

**Response:**
``json
{
  "token": "<JWT_TOKEN>"
}
``

Secured Access
Include the token in the `Authorization` header:
``http
Authorization: Bearer <JWT_TOKEN>
``

The Gateway will:
-Validate the token
-Extract `username` and `role`
-Forward them as headers:
  -`X-User-Email`
  -`X-User-Role`

## Postman Workspace

 Workspace Includes:
-Login request to generate JWT
-Authenticated requests to each microservice
-Unauthorized request examples
-Header inspection for `X-User-Email` and `X-User-Role`

Share Link or Export
Export the workspace and include the link or `.json` file in your submission.

Video Presentation
Record a walkthrough showing:
-JWT flow
-Gateway filtering
-Postman tests
-Microservice responses

Notes
-JWT secret is configured in `application.yml`:
``yaml
jwt:
  secret: your-very-secure-secret-key
``
-Logging is enabled for debugging:
``yaml
logging:
  level:
    org.springframework.cloud.gateway: DEBUG
    reactor.netty.http.client: DEBUG
``

---

Feel free to reach out if you need help with Docker setup, CI/CD integration, or formal verification of security flows.