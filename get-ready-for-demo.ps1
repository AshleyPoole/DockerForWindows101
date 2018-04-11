# Remove all Docker container and images
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)

# Pull base images
docker pull microsoft/powershell:latest
docker pull microsoft/aspnetcore:2.0.0-nanoserver
docker pull microsoft/aspnetcore-build:2.0.0-nanoserver
docker pull microsoft/mssql-server-windows-developer:2017

# Pull backup of demo images
docker pull ashleypoole/hellodocker101
docker pull ashleypoole/musicstoredb
docker pull ashleypoole/musicstore

# Save backup images
New-Item ImageBackups -ItemType directory
Set-Location -Path ImageBackups

docker save ashleypoole/hellodocker101 > hellodocker101.tar
docker save ashleypoole/musicstoredb > musicstoredb.tar
docker save ashleypoole/musicstore > musicstore.tar