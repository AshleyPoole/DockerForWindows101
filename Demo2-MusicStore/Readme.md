# Docker For Windows 101

## Demo 2 - Building and running your application in Docker

This sample application is based on the ASP.NET Core demo application Microsoft called MusicStore - https://github.com/aspnet/MusicStore. The Dockerfile and Compose file in this directory will build and run the demo application including a SQL Server container running on Windows.

### Demo

1) In the compose file, it has been configured to build the image on execution. If you make changes to the build context (i.e application code), you will need to run `docker-compose build` first to rebuild it.

2) You can bring up the MusicStore container and database server by running `docker-compose up -d`. This tells Docker to start up all 'services' in the file. A 'service' definition is an entry that uses a Docker image, or Dockerfile build an image, rather than a prebuild image. Multiple services can be defined in one compose file.

### Other basic commands

docker-compose down - shutdowns the containers specified in the compose file.
