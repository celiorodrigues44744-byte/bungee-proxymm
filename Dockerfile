FROM ghcr.io/viaversion/viaproxy:latest
USER root
RUN mkdir -p /app/run/plugins && \
    wget -O /app/run/plugins/Geyser-ViaProxy.jar \
    https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/viaproxy

RUN cat > /app/run/viaproxy.yml << 'EOF'
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

CMD ["java", "-Xms256M", "-Xmx460M", "-jar", "/app/ViaProxy.jar", "config", "/app/run/viaproxy.yml"]
