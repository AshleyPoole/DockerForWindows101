# Docker For Windows 101

## Demo 3 - Exposing your local development environment

This demonstration uses Cloudflare Argo Tunnel (previously called Cloudflare Warp during development) to expose your local development environment securely, also taking advantage of Cloudflare's CDN and WAF features.

To download or read more about Cloudflare Argo Tunnel, go to https://developers.cloudflare.com/argo-tunnel/. Before running the below commands, it's expected that the binary for your selected platform has been downloaded and the `cloudflare-warp login` has been run.

### Demo

1) Get the IP address of web application as we'll need to tell the tunnel where to forward traffic to. We can get that by running `docker inspect {name or ID of container}`.

2) You can run a Argo Tunnel by running `cloudflare-warp.exe --hostname {host and domain on Cloudflare} -url {url}`. For example, `cloudflare-warp.exe --hostname ndc.ashleypoole.co.uk -url http://localhost:80`.
