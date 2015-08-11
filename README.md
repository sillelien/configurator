

# Sillelien Configurator ${STATE_ACTIVE}

Configure your Docker images on multiple machines from a single GUI.

**If you use this project please consider giving us a star on [GitHub](http://github.com/sillelien/configurator) . Also if you can spare 30 secs of your time please let us know your priorities here https://sillelien.wufoo.com/forms/zv51vc704q9ary/  - thanks, that really helps!**

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Please contact us through chat (below) or through GitHub Issues.

[![Join the chat at https://gitter.im/sillelien/configurator](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/sillelien/configurator?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)


## Introduction

Sillelien Configurator comes in three parts, a server, an editor and your clients. The server must stay at a fixed location and have a mapped volume onto the host, it manages a very simple git repository containing your configuration. The editor is a seperate image powered by [Codebox](http://codebox.io) which allows you to edit any of the files in the git repository. Finally you clients can then run a simple one line command to start getting updates from the server (into the /config directory).

## Quick Start


1) Deploy the server
 
2) Deploy the [Codebox](http://codebox.io) editor and visit the GUI

    http://{editor-ip}:8080
    
If you haven't supplied credential environment variables then you'll need to log in with username/password of insecure/insecure.    

Don't forget you need to **commit** then **push** changes for them to be sent to the server.

3) 

EITHER: On each client that uses configurator you need to name the link to the server as `scserver`. Install `socat` and `git` packages in your client image and then make sure you run the following as a background daemon:

```bash
    curl http://${SCSERVER_PORT_1500_TCP_ADDR}:${SCSERVER_PORT_1500_TCP_PORT} | sh
```

OR: Just run this line on startup for static configuration.
 
```bash
    git clone git://${SCSERVER_PORT_9418_TCP_ADDR}:${SCSERVER_PORT_9418_TCP_PORT}/config /config
```    
    
And that's it, the directory /config will now contain any files you want to use to configure your Docker images.

You can get going straight away using the Deploy to Tutum button.


## Example Deployment

Please use tagged releases where possible, you'll get a better experience and we can support you better.

```yaml

        server:
          image: sillelien/sc-server:0.0.40
          volumes:
            - /var/sc/server:/repo
          ports:
            - "1500"
            - "9418"
        
        editor:
          image: sillelien/sc-editor:0.0.40
          volumes:
            - /var/sc/editor:/config
          links:
            - server:scserver
          ports:
            - "80:8080"
        
        #Just so you can see what's going on
        testclient:
          image: sillelien/sc-client:0.0.40
          command: sh -c "while true; do ls -la /config/; sleep 10; done"
          links:
            - server:scserver

```

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

## Badges

Test Client: [![Docker Registry](https://img.shields.io/docker/pulls/sillelien/sc-client.svg)](https://registry.hub.docker.com/u/sillelien/sc-client)

Server: [![Docker Registry](https://img.shields.io/docker/pulls/sillelien/sc-server.svg)](https://registry.hub.docker.com/u/sillelien/sc-server)

Editor: [![Docker Registry](https://img.shields.io/docker/pulls/sillelien/sc-editor.svg)](https://registry.hub.docker.com/u/sillelien/sc-editor)

Test Client: [![Image Layers](https://badge.imagelayers.io/sillelien/sc-client.svg)](https://imagelayers.io/?images=sillelien/sc-client:latest 'Get your own badge on imagelayers.io') 

Server: [![Image Layers](https://badge.imagelayers.io/sillelien/sc-server.svg)](https://imagelayers.io/?images=sillelien/sc-server:latest 'Get your own badge on imagelayers.io') 

Editor: [![Image Layers](https://badge.imagelayers.io/sillelien/sc-editor.svg)](https://imagelayers.io/?images=sillelien/sc-editor:latest 'Get your own badge on imagelayers.io') 

[![GitHub License](https://img.shields.io/github/license/sillelien/configurator.svg)](https://raw.githubusercontent.com/sillelien/configurator/master/LICENSE)

[![GitHub Issues](https://img.shields.io/github/issues/sillelien/configurator.svg)](https://github.com/sillelien/configurator/issues)
    
[![GitHub Release](https://img.shields.io/github/release/sillelien/configurator.svg)](https://github.com/sillelien/configurator)

(c) 2015 Sillelien all rights reserved. Please see LICENSE for license details of this project. Please visit http://sillelien.com for help and commercial support.
