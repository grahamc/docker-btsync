# Docker container for btsync

## Getting Started

 - Have a configuration and data directory. Make sure the user id `9001` can
   read and write both of these directories.

Run `docker run -i -t grahamc/btsync --dump-sample-config` for an example btsync
configuration. Place the configuration into your configuration directory.

Run:
```shell
docker run -d \
  -v /path/to/config:/mount/config \
  -v /path/to/data:/mount/data     \
  -p 3369/udp -p 3369 -p 8888      \
  grahamc/btsync
```

## Resources
### Volumes
 - `/mount/config` Configuration files for BTSync
 - `/mount/data` Data transferred over BTSync

### Ports
 - `3369` and `3369/udp` for synchronization
 - `8888 for WebUI

