# Jackett Docker Image for Raspberry Pi 
[![Build Status](https://travis-ci.org/nelsonyaccuzzi/docker-rpi-jackett.svg?branch=master)](https://travis-ci.org/nelsonyaccuzzi/docker-rpi-jackett)

## Usage

```
docker run -d \
  --name jackett \
  -v /path/to/config:/config \
  -v /path/to/data:/data \
  -p 9117:9117 \
  --restart unless-stopped \
  nelsonyaccuzzi/docker-rpi-jackett
```
