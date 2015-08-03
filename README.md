# Beets

Small, lightweight Alpine based Beets container.

[![](https://badge.imagelayers.io/gbrks/beets:latest.svg)](https://imagelayers.io/?images=gbrks/beets:latest 'Get your own badge on imagelayers.io')

## Initial Configuration

To generate the initial config.yaml in ```/opt/appdata/beets``` (can be changed as needed), run the following:
```
docker run --rm -it \
  -v /opt/appdata/beets:/config \
  -v <path/to/music>:/music \
  --entrypoint="/bin/sh" \
  gbrks/beets -c init.sh
```

Edit ```/opt/appdata/beets/config.yaml``` as needed with reference to the [Beets Configuration Reference](http://beets.readthedocs.org/en/latest/reference/config.html).

## Usage

For the below examples, ```</path/to/music>``` is the final location where your music is kept.
Run with:
```
docker run --rm -it \
  -v /opt/appdata/beets:/config \
  -v <path/to/music>:/music \
  -v $(pwd):/working \
  gbrks/beets <beets command>
```

Where <beets command> is any command detailed in the [Beets CLI Reference](http://beets.readthedocs.org/en/latest/reference/cli.html).

For example to import a folder:
```
docker run --rm -it \
  -v /opt/appdata/beets:/config \
  -v <path/to/music>:/music \
  -v $(pwd):/working \
  gbrks/beets import <folder in current directory>
```

Add the following alias to .bashrc (or equivalent):
```
alias beet='docker run --rm -it -v /opt/appdata/beets:/config -v <path/to/music>:/music -v $(pwd):/working gbrks/beets'
```

To now import the same folder:
```
beet import <folder in current directory>
```

## Advanced Usage

Each time the above command is run, it starts up a new container, runs the command and then removes the container. This has a slight amount of overhead, and is generally not noticeable if you are importing a bulk folder at one time.

It is possible to enter the container interactively in order to quickly run a number of commands without the overhead of starting the container each time:
```
docker run --rm -it \
  -v /opt/appdata/beets:/config \
  -v /mnt/snap/disk1/Music:/music \
  -v $(pwd):/working \
  --entrypoint="/bin/sh" \
  gbrks/beets
```
Once in the container, run Beets by: ```beet <command>```

## Updating

Since the container is not running other than when explicitly called, updating is simply a matter of:
```
docker pull gbrks/beets
```
The image on docker hub will generally be kept at the latest version.
