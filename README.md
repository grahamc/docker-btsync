# Docker container for btsync

## Getting Started

### For a zero-configuration setup:
 - Have a data directory. Make sure the user id `9001` can read and write this
   directory.
 - Create directories in your data directory for each btsync share.
 - Note that we don't forward 8888 because the web UI is not necessary when
   configuring BTSync in this way. Simply alter the list of secrets and
   redeploy.

Run BTSync as such:

```
docker run -d \
  -v /patch/to/data:/mount/data                  \
  -p 3369/udp -p 3369                            \
  -e BTSYNC_NAME='my-docker-server'              \
  -e BTSYNC_SECRET_<your_secret_here>=horse-pics \
  -e BTSYNC_SECRET_<your_secret_here>=other-pics \
  -e ...
  grahamc/btsync
```

Operational example:

```
docker run -d \
  -v /patch/to/data:/mount/data                  \
  -p 3369/udp -p 3369                            \
  -e BTSYNC_NAME='my-docker-server'              \
  -e BTSYNC_SECRET_B7CNMISMNG22Z6M4Y5B7NT6LP5HBWMRXV=horse-pics \
  grahamc/btsync
```

### For a configuration-file-based setup:
 - Have a configuration and data directory. Make sure the user id `9001` can
   read the configuration dir, and write the data directory.

Run `docker run -i -t grahamc/btsync --dump-sample-config` for a sample btsync
configuration. Also see `example.conf` which is known to work on this container.
Place the configuration into your configuration directory as `btsync.conf`.

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
 - `/mount/config` Configuration files for BTSync. UID 9001 only needs read.
 - `/mount/data` Data transferred over BTSync. UID 9001 needs RW access.

### Ports
 - `3369` and `3369/udp` for synchronization
 - `8888 for WebUI

