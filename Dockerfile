# syntax=docker/dockerfile:1

FROM eclipse-temurin:19-jdk-alpine as builder

RUN mkdir -p /app/.mvn/wrapper/ && mkdir /app/src

COPY ["mvnw", "mvnw.cmd", "pom.xml", "/app/"]

COPY src /app/src

COPY [".mvn/wrapper/maven-wrapper.jar", ".mvn/wrapper/maven-wrapper.properties", "/app/.mvn/wrapper/"]

RUN cd /app && \
  ./mvnw clean package

WORKDIR /app

FROM eclipse-temurin:19-jdk-alpine as runner

VOLUME /tmp

COPY --from=builder /app/target/restservice-0.0.1.jar /app/app.jar

ENTRYPOINT ["java","-jar","/app/app.jar"]