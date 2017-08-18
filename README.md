# SwiftServerContainer
A server container with Swift environment and a Vapor websocket server to handle requests from MAMoC (https://github.com/dawand/MAMoC) client applications

There are two ways to install the container:

1. Dockerfile: You can build the provided dockerfile which fetches a pre-built container including a web socket to serve the client requests.  
     First copy the Dockerfile to a folder in your server and build it  
    `docker build -t mamoc-container .`  

     After the image is fetched, you can run it:  
    `docker run --privileged -i -t --name myContainer -p 80:8080 mamoc-container`  


2. Build your own container: You can setup Swift environment on your server and copy the MEC-Container folder to the desired location. You can customise the server based on your needs. Have a look at [Vapor](https://github.com/vapor/vapor) and WebSocket documentations to understand the server side code and customise it to your applications.

## Adding new requests

Check this [file](https://github.com/dawand/SwiftServerContainer/blob/master/Sources/App/Droplet%2BSetup.swift) and add your own handlers.
