# syntax=docker/dockerfile:1

################################################################################
# Stage 1: Resolve and download dependencies
################################################################################
FROM eclipse-temurin:17-jdk-jammy AS depsi

WORKDIR /build

COPY --chmod=0755 mvnw mvnw
COPY .mvn/ .mvn/
COPY pom.xml .

RUN --mount=type=cache,target=/root/.m2 \
    ./mvnw dependency:go-offline -DskipTests

################################################################################
# Stage 2: Build the application
################################################################################
FROM depsi AS package

WORKDIR /build

COPY ./src src/
COPY pom.xml .

RUN --mount=type=cache,target=/root/.m2 \
    ./mvnw package -DskipTests && \
    mv target/$(./mvnw help:evaluate -Dexpression=project.artifactId -q -DforceStdout)-$(./mvnw help:evaluate -Dexpression=project.version -q -DforceStdout).jar target/app.jar

################################################################################
# Stage 3: Extract Spring Boot layers
################################################################################
FROM package AS extract

WORKDIR /build

RUN java -Djarmode=layertools -jar target/app.jar extract --destination target/extracted

################################################################################
# Stage 4: Final runtime image
################################################################################
FROM eclipse-temurin:17-jre-jammy AS final

ARG UID=10001
RUN adduser \
    --disabled-password \
    --gecos "" \
    --home "/nonexistent" \
    --shell "/sbin/nologin" \
    --no-create-home \
    --uid "${UID}" \
    appuser
# USER appuser

COPY --from=extract build/target/extracted/dependencies/ ./
COPY --from=extract build/target/extracted/spring-boot-loader/ ./
COPY --from=extract build/target/extracted/snapshot-dependencies/ ./
COPY --from=extract build/target/extracted/application/ ./

ENTRYPOINT [ "java", "org.springframework.boot.loader.launch.JarLauncher" ]

# ENTRYPOINT [ "java", "org.springframework.boot.loader.launch.JarLauncher" ]
