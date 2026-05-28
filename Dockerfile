FROM eclipse-temurin:17-jre
WORKDIR /app
RUN apt-get update && apt-get install -y wget
RUN wget -O BungeeCord.jar https://ci.md-5.net/job/BungeeCord/lastSuccessfulBuild/artifact/bootstrap/target/BungeeCord.jar
EXPOSE 25577
CMD ["java", "-Xms128M", "-Xmx256M", "-jar", "BungeeCord.jar"]
