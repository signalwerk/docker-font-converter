

## Pull from Dockerhub
```sh
docker pull signalwerk/font-converter
```

## How to convert fonts

Convert all `ttf` and `otf` files in the current directory (default):
```sh
docker run -it -v `pwd`:/fonts signalwerk/font-converter
```

Convert some `otf` files in `/mnt/silly-project`:
```sh
docker run -it -v /mnt/silly-project:/fonts signalwerk/font-converter project*.otf
```


## Build from Source

Fetch the code

```sh
git clone https://github.com/signalwerk/docker-font-converter.git
cd docker-font-converter
docker build -t signalwerk/font-converter .
# or
docker build --no-cache -t signalwerk/font-converter .
```

## Examples
```sh
fonttools feaLib -o SH-OpenSans-Regular.ttf ./upper.fea ./Open_Sans/OpenSans-Regular.ttf

```



## References
* [Ambroise Maupate – webfont-generator](https://github.com/ambroisemaupate/docker/tree/master/webfont-generator)
* [Signalwerk on Dockerhub](https://hub.docker.com/u/signalwerk)
