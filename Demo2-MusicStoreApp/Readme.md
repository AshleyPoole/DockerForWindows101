# Docker For Windows 101

## Demo 2 - Building and running your application in Docker

This demonstration shows how to build and package up a existing .NET application into a Windows based container. The sample application is based on the ASP.NET Core demo application from Microsoft called [MusicStore](https://github.com/aspnet/MusicStore). The Dockerfile and Compose file in this directory will build and run the demo application including a SQL Server container running on Windows. During the talk, these will be constructed and explained. For the demo notes below, we will assume those files don't exist and that we're building them from scratch.

Prebuild images are also pushed to the Docker hub as well for convenience and demo backup purposes.

### Demo

1) First create a file within the `Demo2-MusicStore` folder called `Dockerfile`. Note no file extension should be present on the file.

2) Open the file so we can write the Docker instructions required to build our image. We'll be building out application in the container, so we'll need to use a base image that has the build tools installed. 

```plain
FROM microsoft/aspnetcore-build:2.0.0-nanoserver
COPY . .
RUN dotnet publish --configuration Release --framework netcoreapp2.0 --output /output
WORKDIR /output
ENTRYPOINT ["dotnet", "MusicStore.dll"]
```

3) Now build the container image by running `docker build -t ashleypoole/musicstore:latest .`. The `.` character denotes to build using the current folders context, so ensure you're in the `Demo2-MusicStore` directory when running through these commands.

4) After the image has been successfully build, let's run a container using the image we've built by running `docker run --name musicstore ashleypoole/musicstore:latest`. You will notice the container starts but then exits as it cannot connect to its database.

5) For the purpose of this demo, I have precreated a database image containing the database including the schema and sample data. We can choose to run the database image using `docker run` command or we can choose to construct our services using a compose file. For this demo, we will be using a compose file. Create a file within the `Demo2-MusicStore` folder called `docker-compose.yml`.

6) Within the Docker compose file, let's declare the web server container definition and database server definition.

```plain
version: '3.3'
services:
  music-store-web:
    image: ashleypoole/musicstore:latest
    ports:
      - 80:80
    environment:
      - "Data:DefaultConnection:ConnectionString=Data Source=music-store-db;Database=MusicStore;User Id=sa;Password=NDC_MN_2018"
    depends_on:
      - music-store-db

  music-store-db:
    image: ashleypoole/musicstoredb:latest
    ports:
      - 1433:1433
    environment:
      - sa_password=NDC_MN_2018
      - ACCEPT_EULA=Y
```

In this file, we're declaring two 'services' called `music-store-web` and `music-store-db` which are based on prebuilt images. For both images, we're mapping ports from the host into the service and also specifying environment variables. You'll notice the `depends_on` attribute for the `music-store-web` container which tells Docker that the web service depends on the database service so it should be started first. Its worth noting, while it will start the container first, it will not wait for SQL Server to be running operational which may cause issues.

Docker maintains an internal DNS server, so you'll notice in the connection string that we can reference the database service by the service name rather than the IP address of the container. 

7) You can bring up the MusicStore container and database server by running `docker-compose up -d`. This tells Docker to start up all 'services' in the file in detached mode.

8) We can then view the logs for our service by running `docker logs demo2musicstoreapp_music-store-web_1`. If the application has started up successfully, the last log statement should contain `Application started`. If the application has indeed exited (which is caused by the database service not being ready yet), then running `docker-compose up -d` again will correct this and bring up a new instance of the web container.

9) Now we can connect to our web application by grabbing the IP address of our web container and browsing to it on port 80. Like before, we can use the `docker inspect` command to inspect a particular container and get its IP address. We can also open the web application directly from Powershell by running `Start-Process http://$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' demo2musicstoreapp_music-store-web_1)`.

10) If you're moving onto demo3 next using Cloudflare Argo Tunnel, leave the containers running, else run `docker-compose down` if you have finished to shutdown the containers.

### Other basic commands

`docker image ls` - lists the images stored locally.
