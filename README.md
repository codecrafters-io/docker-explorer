This is a test program for the Docker challenge.

You'll need to install it into `/usr/local/bin/docker-explorer` to use it for the
Docker challenge.

# Installation

If you're on Mac: 

```
sudo curl -Lo /usr/local/bin/docker-explorer https://github.com/codecrafters-io/docker-explorer/releases/download/v17/v17_darwin_amd64
sudo chmod +x /usr/local/bin/docker-explorer
```

If you're on linux: 

```
sudo curl -Lo /usr/local/bin/docker-explorer https://github.com/codecrafters-io/docker-explorer/releases/download/v17/v17_linux_amd64
sudo chmod +x /usr/local/bin/docker-explorer
```

To verify that the installation worked, run: 

``` sh
docker-explorer echo hey
```

You should see `hey` printed back. 

