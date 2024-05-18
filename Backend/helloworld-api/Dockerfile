# Build stage
FROM maven:3.9.5-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean install

# Run stage
FROM eclipse-temurin:17.0.6_10-jdk
WORKDIR /app
COPY --from=build /app/target/helloworld-api-0.0.1-SNAPSHOT.jar /app/demoapp.jar

# Environment variable to set the profile
ENV SPRING_PROFILES_ACTIVE=dev

EXPOSE 8081
CMD ["sh", "-c", "java -jar demoapp.jar --spring.profiles.active=${SPRING_PROFILES_ACTIVE}"]
