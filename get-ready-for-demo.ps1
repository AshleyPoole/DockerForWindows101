# Remove all Docker container and images
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)

docker pull ashleypoole/hellodocker101
docker pull microsoft/aspnetcore-build:2.0.0-nanoserver
docker pull microsoft/mssql-server-windows-developer:2017
docker pull microsoft/aspnetcore:2.0.0-nanoserver
microsoft/mssql-server-windows-developer