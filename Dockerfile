FROM eclipse-temurin:21-jre
WORKDIR /app
RUN apt-get update && apt-get install -y wget

RUN wget -O ViaProxy.jar https://github.com/ViaVersion/ViaProxy/releases/download/v3.4.12-SNAPSHOT/ViaProxy.jar || \
    wget -O ViaProxy.jar https://ci.viaversion.com/job/ViaProxy/lastSuccessfulBuild/artifact/build/libs/ViaProxy-3.4.12-SNAPSHOT.jar || \
    wget --no-check-certificate -O ViaProxy.jar "https://github.com/ViaVersion/ViaProxy/releases/latest/download/ViaProxy.jar"

RUN mkdir -p plugins && \
    wget -O plugins/Geyser-ViaProxy.jar \
    https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/viaproxy

RUN cat > viaproxy.yml << 'EOF'
bind_address: 0.0.0.0
bind_port: 25568
target_address: 15.235.212.121
target_port: 11795
target_version: "1.21"
proxy_online_mode: false
auth_method: none
EOF

EXPOSE 19132/udp
EXPOSE 25568

CMD ["java", "-Xms256M", "-Xmx460M", "-jar", "ViaProxy.jar", "config", "viaproxy.yml"]
