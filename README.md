# Sillelien Configurator

Configure your Docker images on multiple machines from a single GUI.

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

## Introduction

Sillelien Configurator comes in three parts, a server, an editor and your clients. The server must stay at a fixed location and have a mapped volume, it manages a very simple git repository containing your configuration. The editor is a seperate image powered by [Codebox](http://codebox.io) which allows you to edit any of the files in the git repository. Finally you clients can then run a simple one line command to start getting updates from the server (into the /config directory).

## Quick Start


1) Deploy the server
 
2) Deploy the editor and visit the GUI

    http://{editor-ip}:8080
    
If you haven't supplied credential environment variables then you'll need to log in with username/password of insecure/insecure.    

3) 

EITHER: On each client that uses configurator you need to install git and then make sure you run the following as a background daemon:

```bash
    curl http://${SCSERVER_PORT_1500_TCP_ADDR}:${SCSERVER_PORT_1500_TCP_PORT} | sh
```

OR: Just run this line on startup for static configuration.
 
```bash
    git clone git://${SCSERVER_PORT_9418_TCP_ADDR}:${SCSERVER_PORT_9418_TCP_PORT}/config /config
```    
    
And that's it, the directory /config will now contain any files you wish to edit and share.

You can get going straight away using the Deploy to Tutum button.

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Client: [![Docker Registry](https://img.shields.io/docker/pulls/sillelien/configurator-client.svg)](https://registry.hub.docker.com/u/sillelien/configurator-client)

Server: [![Docker Registry](https://img.shields.io/docker/pulls/sillelien/configurator-server.svg)](https://registry.hub.docker.com/u/sillelien/configurator-server)

Client: [![Image Layers](https://badge.imagelayers.io/sillelien/configurator-client.svg)](https://imagelayers.io/?images=sillelien/configurator-client:latest 'Get your own badge on imagelayers.io') 

Server: [![Image Layers](https://badge.imagelayers.io/sillelien/configurator-server.svg)](https://imagelayers.io/?images=sillelien/configurator-server:latest 'Get your own badge on imagelayers.io') 

[![GitHub License](https://img.shields.io/github/license/sillelien/configurator.svg)](https://raw.githubusercontent.com/sillelien/configurator/master/LICENSE)

[![GitHub Issues](https://img.shields.io/github/issues/sillelien/configurator.svg)](https://github.com/sillelien/configurator/issues)
    
[![GitHub Release](https://img.shields.io/github/release/sillelien/configurator.svg)](https://github.com/sillelien/configurator)

