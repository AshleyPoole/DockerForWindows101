# Docker For Windows 101

## Demo 2 - Building and running your application in Docker

This sample application is based on the ASP.NET Core demo application from Microsoft called [MusicStore]( https://github.com/aspnet/MusicStore). The Dockerfile and Compose file in this directory will build and run the demo application including a SQL Server container running on Windows. During the talk, these will be constructed and explained. For the demo notes below, we will assume those files don't exist and that we're building them.

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

4) After the image has been successfully build, let's run a container using the image we've built by running `docker run --name musicstore ashleypoole/musicstore:latest`. You will notice the container starts but then exits as it cannot connect to it's database.

5) For the purpose of this demo, I have precreated a database image containing the database including the schema and sample data. We can choose to run the database image using `docker run` command or we can choose to construct our services using a compose file. For this demo, we will be using a compose file. Create a file within the `Demo2-MusicStore` folder called `docker-compose.yml`.





2) You can bring up the MusicStore container and database server by running `docker-compose up -d`. This tells Docker to start up all 'services' in the file. A 'service' definition is an entry that uses a Docker image, or Dockerfile build an image, rather than a prebuild image. Multiple services can be defined in one compose file.

### Other basic commands

docker-compose down - shutdowns the containers specified in the compose file.
