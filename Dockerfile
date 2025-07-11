FROM openjdk:17-jdk-slim
WORKDIR /app
COPY . .

RUN chmod +x ./gradlew
RUN ./gradlew bootJar

ENV JAR_PATH=/app/build/libs
run mv ${JAR_PATH}/*.jar /app/app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]