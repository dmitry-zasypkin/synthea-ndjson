FROM eclipse-temurin:11-jdk-alpine

USER root

RUN mkdir /synthea
WORKDIR /synthea

ADD https://github.com/synthetichealth/synthea/releases/download/master-branch-latest/synthea-with-dependencies.jar .

COPY ./synthea.properties .

ENTRYPOINT  [ "java", "-jar" , "./synthea-with-dependencies.jar", "-c", "./synthea.properties" , "Massachusetts" ]
