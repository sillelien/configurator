To use configurator 


1) Deploy the server
 
2) Deploy the editor and visit the GUI

    http://{editor-ip}:8080
    
If you haven't supplied credential environment variables then you'll need to log in with username/password of insecure/insecure.    

3) On each client that uses configurator you need to install git and then make sure they run the following as a daemon:

    curl http://${SERVER_PORT_1500_TCP_ADDR}:${SERVER_PORT_1500_TCP_PORT} | sh

And that's it, the directory /config will now contain any files you wish to edit and share.


[![Deploy to Tutum](https://s.tutum.co/deploy-to-tutum.svg)](https://dashboard.tutum.co/stack/deploy/)

Client: [![Docker Registry](https://img.shields.io/docker/pulls/sillelien/configurator-client.svg)](https://registry.hub.docker.com/u/sillelien/configurator-client)

Server: [![Docker Registry](https://img.shields.io/docker/pulls/sillelien/configurator-server.svg)](https://registry.hub.docker.com/u/sillelien/configurator-server)

Client: [![Image Layers](https://badge.imagelayers.io/sillelien/configurator-client.svg)](https://imagelayers.io/?images=sillelien/configurator-client:latest 'Get your own badge on imagelayers.io') 

Server: [![Image Layers](https://badge.imagelayers.io/sillelien/configurator-server.svg)](https://imagelayers.io/?images=sillelien/configurator-server:latest 'Get your own badge on imagelayers.io') 

[![GitHub License](https://img.shields.io/github/license/sillelien/configurator.svg)](https://raw.githubusercontent.com/sillelien/configurator/master/LICENSE)

[![GitHub Issues](https://img.shields.io/github/issues/sillelien/configurator.svg)](https://github.com/sillelien/configurator/issues)
    
[![GitHub Release](https://img.shields.io/github/release/sillelien/configurator.svg)](https://github.com/sillelien/configurator)

