# rpi-ddclient
Docker container for hosting ddclient on Raspberry Pi

### Usage
Create a ddclient.conf file for your specific needs.  
You can either use this container as-is, and mount your config file into it:  
```docker run --volume ddclient.conf:/etc/ddclient/ddclient.conf --restart always --detach valmaye/ddclient```

or create your own image with your config file baked in:
```
FROM valmaye/ddclient
COPY ddclient.conf /etc/ddclient/ddclient.conf
```

This container is set up to update your DDNS every 5 minutes (-daemon=300); because of the way ddclient is written, this means it will also pause for 5 min on first startup before attempting the first update, so be aware of this when you are testing your configuration.

