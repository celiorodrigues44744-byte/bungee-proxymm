FROM eclipse-temurin:17-jre
WORKDIR /app
RUN apt-get update && apt-get install -y wget
RUN wget -O Geyser.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone
EXPOSE 19132/udp
CMD ["java", "-Xms128M", "-Xmx256M", "-jar", "Geyser.jar"]
