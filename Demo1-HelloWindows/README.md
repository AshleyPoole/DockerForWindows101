# Docker For Windows 101

## Demo 1 - HelloDocker image and basic commands

If the image (`ashleypoole/hellodocker101`) hasn't been built yet local or pushed to Docker Hub, run `BuildDockerImage.ps1` which will build the image for you. Alternatively run the Docker command directly `docker build -t ashleypoole/hellodocker101:latest .` within the `hellodocker` directory.

### Demo

1) [Docker Hub](https://hub.docker.com/) is an online registry of images that have been built and published for public consumption. You can also build and store private images on the Docker Hub using a paid for subscription or by running an internal registry to your organisation or network.

2) Create a container from the HelloDocker101 image by running `docker run ashleypoole/hellodocker101`.
Note, if you don't list an image tag, it will default to `latest`. It will also pull down the image if not found locally and by default will keep hold of the terminal. To start the container in detached mode, run `docker run -d ashleypoole/hellodocker101`. Use `Ctrl+C` to exit the container and get back control of the terminal if running in interactive mode (i.e non-detached mode).

3) You can check the containers status by using `docker ps` command to list all running containers. Alternatively, if you want to see stopped containers you can run `docker ps -a` to list all containers regardless of their status.

4) In order to connect to the container which hosts a web server on port 80, we will need to fetch the containers IP address by running `docker inspect XYZ`. Replace XYZ with the container ID or name found in above command. Tip - you can use the first few characters of the container ID if it's unique.

You can also format the output to only return the IP address. For example, `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_container_id`.

5) Now navigate to container's IP. On Server 2016, it will be the host's IP but on Windows 10 as containers are run in Hyper-V mode which means each container receives its own IP address on an internal host network. Hyper-V mode will be explained during the talk.  More information on this can also be found on [Microsoft's quick start guide](https://docs.microsoft.com/en-us/virtualization/windowscontainers/quick-start/quick-start-windows-10) on Windows contains.

6) After finished, you can stop the container using `docker stop XYZ`, replacing XYZ with the container ID or name found in from using `docker ps` command and then also removed by running `docker rm XYZ`. Alternatively, force the removal without stopping the container by using `docker stop XYZ -f`.

### Other basic commands

`docker pull` - Used to pull images from a Docker registry. For example, `docker pull ashleypoole/hellodocker101:latest`.

`docker start` - Used to start a container. For example, `docker start container_name_or_container_id`.

`docker exec` - Used to execute a command within a container. For example, `docker exec container_name_or_container_id powershell Write-Host HelloWorld`.

`docker search` - Used to search Docker registry for an image. For example, `docker search mssql`.

For further reference, check out [Docker's command line documentation](https://docs.docker.com/engine/reference/commandline/).