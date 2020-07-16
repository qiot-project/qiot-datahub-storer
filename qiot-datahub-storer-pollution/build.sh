chmod +x mvn*
./mvnw clean package -Pnative  -Dquarkus.native.container-build=true -Dquarkus.native.container-runtime=docker
docker rmi quay.io/qiot/qiot-datahub-storer-pollution
docker build -f src/main/docker/Dockerfile.native -t quay.io/qiot/qiot-datahub-storer-pollution .
docker push quay.io/qiot/qiot-datahub-storer-pollution
#docker run -it --rm -p 5000:5000 --net host quay.io/qiot/qiot-datahub-registration
