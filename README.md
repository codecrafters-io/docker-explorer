This is a test program for the Docker challenge.

You'll need to install it into `/usr/bin/docker-explorer` to use it for the
Docker challenge.

# Installation

If you're on linux: 

```
curl -Lo /usr/bin/docker-explorer https://github.com/codecrafters-io/docker-explorer/releases/download/v11/v11_linux_amd64
chmod +x /usr/bin/docker-explorer
```

If you're on Mac: 

```
curl -Lo /usr/bin/docker-explorer https://github.com/codecrafters-io/docker-explorer/releases/download/v11/v11_darwin_amd64
chmod +x /usr/bin/docker-explorer
```

To verify that the installation worked, run: 

``` sh
docker-explorer echo hey
```

You should see `hey` printed back. 

