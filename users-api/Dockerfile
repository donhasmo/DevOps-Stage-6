FROM maven:3.6.3-jdk-8 AS builder
WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn package -DskipTests 

FROM amazoncorretto:8
WORKDIR /app

COPY --from=builder /app/target/*.jar ./users-api.jar
EXPOSE 8083
CMD ["java", "-jar", "users-api.jar"]
