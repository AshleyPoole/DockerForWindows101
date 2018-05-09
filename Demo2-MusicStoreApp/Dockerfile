FROM microsoft/aspnetcore-build:2.0-nanoserver AS Build

COPY . .

# In dotnet core 2.0 an explict restore isn't required but can be useful for CI builds
RUN dotnet restore

RUN dotnet publish --configuration Release --framework netcoreapp2.0 --output /output


FROM microsoft/aspnetcore:2.0.0-nanoserver

ENV ASPNETCORE_URLS http://+:80
EXPOSE 80

WORKDIR /application

COPY --from=Build /output .

ENTRYPOINT ["dotnet", "MusicStore.dll"]