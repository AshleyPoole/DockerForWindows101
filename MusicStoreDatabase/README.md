# Docker For Windows 101

## Demo 2 - MusicStore Database Setup

This demo contains the compose file to bring up a SQL Server container ready for the MusicStore demo.

### Demo

1) Bring up the database server by running `docker-compose up -d`. This tells Docker to start up all 'services' in the file. A 'Service' definition is an entry that uses a Docker image or Dockerfile to create an running instance of an image. Multiple services can be defined in one compose file.

2) Within the MusicStore applications settings, set the database name and credentials to those in the database compose file. This works as Docker has it's own internal DNS resolution.

### Other basic commands

docker-compose down - shutdowns the containers specified in the compose file.
