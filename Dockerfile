FROM eclipse-temurin:21-jre
WORKDIR /app
RUN apt-get update && apt-get install -y wget

# Download ViaProxy
RUN wget -O ViaProxy.jar https://github.com/ViaVersion/ViaProxy/releases/latest/download/ViaProxy.jar

# Pre-run to generate config
RUN java -jar ViaProxy.jar nogui || true

# Download Geyser-ViaProxy plugin
RUN mkdir -p plugins && \
    wget -O plugins/Geyser-ViaProxy.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/viaproxy

# Configure ViaProxy
RUN mkdir -p configs && cat > viaproxy.yml << 'EOF'
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

CMD ["java", "-Xms128M", "-Xmx256M", "-jar", "ViaProxy.jar", "nogui"]
