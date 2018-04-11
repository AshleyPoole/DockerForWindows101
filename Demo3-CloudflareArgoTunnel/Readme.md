# Docker For Windows 101

## Demo 3 - Exposing your local development environment

This demonstration uses Cloudflare Argo Tunnel (previously called Cloudflare Warp during development/beta) to securely expose your local development environment to the internet by taking advantage of Cloudflare's platform.

To download the `cloudflared` binary or read more about Cloudflare Argo Tunnel, go to https://developers.cloudflare.com/argo-tunnel/. Before going through the below demo it's expected that the binary for your selected platform has been downloaded, extracted to your current working directory or exists in your PATH, and that you have also run `cloudflared login` command  which walk you through logging into your Cloudflare account.

Note - Cloudflare Argo Tunnel is a premium feature which is billed on usage.

### Demo

1) Get the IP address of web application that we used in demo2 (music store application) by running `docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' demo2musicstoreapp_music-store-web_1`. The IP address is needed in order to configure the tunnel that we'll create with Cloudflare Argo Tunnel.

2) You can now create a Argo Tunnel by running `cloudflared --hostname {host and domain on Cloudflare} --url {url}`. For example, `cloudflared --hostname ndc.ashleypoole.co.uk --url http://172.30.217.108:80`. It's important to include the protocol, HTTP in this case in the forward URL configuration for Argo Tunnel.

3) You should now be able to navigate to your selected host name on HTTPS. For example, `https://ndc.ashleypoole.co.uk` and you should see the MusicStore application.

4) Once finished, you can press `Ctrl+C` to exist. You can also install `cloudflared` as a service, as detailed in their documentation. You can also run the process within a Docker container as well.
