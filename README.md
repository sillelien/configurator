

# Sillelien Configurator [![Active Development](https://img.shields.io/badge/Status-Active_Initial_Development-orange.svg?style=flat)](http://github.com/sillelien/configurator)

Configure your Docker images on multiple machines from a single GUI.

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

-------

**If you use this project please consider giving us a star on [GitHub](http://github.com/sillelien/configurator). Also if you can spare 30 secs of your time please let us know your priorities here https://sillelien.wufoo.com/forms/zv51vc704q9ary/  - thanks, that really helps!**

Please contact us through chat or through GitHub Issues.

[![GitHub Issues](https://img.shields.io/github/issues/sillelien/configurator.svg)](https://github.com/sillelien/configurator/issues)

[![Join the chat at https://gitter.im/sillelien/configurator](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/sillelien/configurator?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

-------


## Introduction


[![Screenshot 1](https://raw.githubusercontent.com/sillelien/scheduler/master/.assets/screenshot-1.png)](https://raw.githubusercontent.com/sillelien/scheduler/master/.assets/screenshot-1.png)

Sillelien Configurator is a tool to allow the editing of Docker runtime configuration files. Consider it as an easy to use simplified version of [etcd](https://coreos.com/etcd/) that follows the unix philosophy of "everything is a file". So instead of a custom REST interface you get to edit files in a git repository.

With Configurator you can quickly add a high quality mechanism for changing the runtime configuration of your images. For example Configurator is used in [Sillelien Scheduler](https://github.com/sillelien/scheduler) to allow editing of schedules.

Sillelien Configurator comes in three parts, a git server, an editor and your clients. The server must stay at a fixed location and have a mapped volume onto the host, it manages a very simple git repository containing your configuration. The editor is a seperate image powered by [Codebox](http://codebox.io) which allows you to edit any of the files in the git repository within a web based IDE. Finally your clients can then run a simple one line command (below) to start getting updates from the server (into the /config directory).

```bash
    curl http://${SCSERVER_PORT_1500_TCP_ADDR}:${SCSERVER_PORT_1500_TCP_PORT} | sh
```


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
          image: sillelien/sc-server:0.0.63
          volumes:
            - /var/sc/server:/repo
          ports:
            - "1500"
            - "9418"
        
        editor:
          image: sillelien/sc-editor:0.0.63
          volumes:
            - /var/sc/editor:/config
          links:
            - server:scserver
          ports:
            - "80:8080"
        
        #Just so you can see what's going on
        testclient:
          image: sillelien/sc-client:0.0.63
          command: sh -c "while true; do ls -la /config/; sleep 10; done"
          links:
            - server:scserver

```

[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

## Badges

Test Client: [![Docker Registry](https://img.shields.io/docker/pulls/sillelien/sc-client.svg?style=flat)](https://registry.hub.docker.com/u/sillelien/sc-client)

Server: [![Docker Registry](https://img.shields.io/docker/pulls/sillelien/sc-server.svg?style=flat)](https://registry.hub.docker.com/u/sillelien/sc-server)

Editor: [![Docker Registry](https://img.shields.io/docker/pulls/sillelien/sc-editor.svg?style=flat)](https://registry.hub.docker.com/u/sillelien/sc-editor)

Test Client: [![Image Layers](https://badge.imagelayers.io/sillelien/sc-client.svg?style=flat)](https://imagelayers.io/?images=sillelien/sc-client:latest 'Get your own badge on imagelayers.io') 

Server: [![Image Layers](https://badge.imagelayers.io/sillelien/sc-server.svg?style=flat)](https://imagelayers.io/?images=sillelien/sc-server:latest 'Get your own badge on imagelayers.io') 

Editor: [![Image Layers](https://badge.imagelayers.io/sillelien/sc-editor.svg?style=flat)](https://imagelayers.io/?images=sillelien/sc-editor:latest 'Get your own badge on imagelayers.io') 

--------

[![GitHub License](https://img.shields.io/github/license/sillelien/configurator.svg)](https://raw.githubusercontent.com/sillelien/configurator/master/LICENSE)

(c) 2015 Sillelien all rights reserved. Please see [LICENSE](https://raw.githubusercontent.com/sillelien/configurator/master/LICENSE) for license details of this project. Please visit http://sillelien.com for help and commercial support or raise issues on [GitHub](https://github.com/sillelien/configurator/issues).