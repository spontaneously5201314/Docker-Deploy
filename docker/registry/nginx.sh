sudo docker run -d -p 443:443 \
     -e REGISTRY_HOST="docker-registry" -e REGISTRY_PORT="5000" -e \
     SERVER_NAME="localhost" --link docker-registry:docker-registry \
     -v /opt/docker/registry/conf/docker-registry.htpasswd:/etc/nginx/.htpasswd:ro \
     -v /opt/docker/registry/conf:/etc/nginx/ssl:ro \
     --name docker-registry-proxy containersol/docker-registry-proxy