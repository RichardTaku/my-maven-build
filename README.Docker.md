## Spring Boot Microservice

- **Java 17 + Maven** project  
- **Embedded Tomcat** running on port 9097  
- **H2 in-memory database** with JPA/Hibernate for persistence  
- **HikariCP** connection pooling  
- **Spring Actuator** enabled for health checks  
- Fully Dockerized and ready to run locally or in Kubernetes  

### Run Locally
```bash
docker build -t task-microservice .
docker run -p 9097:9097 task-microservice

##Access the app at:
http://localhost:9097
