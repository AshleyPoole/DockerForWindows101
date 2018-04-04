FROM microsoft/aspnetcore-build:2.0.0-nanoserver AS Build

# Copy source code directory into a directory in the container at /src/
COPY . .

# Change directory into /src/
WORKDIR /src/

# Build and publish to a directory in the container at /out
RUN dotnet publish -c Release -o /output ./HelloDockerWindows.csproj


# This is the container image that will be used to create the runtime image
FROM microsoft/aspnetcore:2.0.0-nanoserver

# Change directory into /HelloDockerWindows in the container image
WORKDIR /HelloDockerWindows

# Set environment variable
ENV ASPNETCORE_URLS http://+:8081

# Expose port from container during runtime
EXPOSE 8081

# Copy build output from build container
COPY --from=Build /output .

# Run the HelloDockerWindows.dll
ENTRYPOINT ["dotnet", "HelloDockerWindows.dll"]