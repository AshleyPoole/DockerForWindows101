# Docker For Windows 101

## Demo 1 - HelloDocker image and basic commands

If the image (`ashleypoole/hellodocker101`) hasn't been built yet local or pushed to Docker Hub, run `BuildDockerImage.ps1` which will build the image for you. Alternatively run the Docker command directly `docker build -t ashleypoole/hellodocker101:latest .` within the `hellodocker` directory.

### Demo

1) Demonstrate Docker Hub which is an online registry of public images that have been published.

2) Create a container from the HelloDocker101 image by running `docker run ashleypoole/hellodocker101`.
Note, if you don't list an image tag, it will default to `latest`. It will also pull down the image if not found locally and by default will keep hold of the terminal. To start the container in detached mode, run `docker run -d ashleypoole/hellodocker101`.

3) You can check the containers status by using `docker ps` command.

4) Fetch the containers IP by running `docker inspect XYZ`. Replace XYZ with the container ID or name found in above command.

5) Navigate to container's IP. On Server 2016, it will be the host's IP but on Windows 10 containers are run in Hyper-V mode which means each container receives its own IP address on an internal host network. Hyper-V mode will be explained in the talk.

6) After finished, you can stop the container using `docker stop XYZ` and then removed by `docker rm XYZ`. Replace XYZ with the container ID or name found in above command. Alternatively, force the removal using `docker stop XYZ -f`.

### Other basic commands

docker pull - Used to pull images from a Docker registry.

docker start - Used to start a container.

docker exec - Used to execute a command within a container.

docker search - Used to search Docker registry for an image.