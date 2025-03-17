# Hailortcli Docker

[HailoRT CLI](https://github.com/hailo-ai/hailort) is a command line application used to control the Hailo device, run inferences, collect statistics and device events, etc.

[HailoRT CLI Docker](https://github.com/l-nmch/hailortcli-docker) is just a dockerized version of **HailoRT CLI**

## Usage

Simple commands to use hailortcli-docker

### Build

```bash
docker build -t hailrtcli-docker .
```

### Run

```bash
docker run --privileged --rm hailortcli-image fw-control identify
```

```
Executing on device: 0000:01:00.0
Identifying board
Control Protocol Version: 2
Firmware Version: 4.20.0 (release,app,extended context switch buffer)
Logger Version: 0
Board Name: Hailo-8
Device Architecture: HAILO8L
Serial Number: <N/A>
Part Number: <N/A>
Product Name: <N/A>
```

There is also a [docker compose](./docker-compose.yml) version

## Disclaimer

This image has only been tested on a [Raspberry PI 5](https://www.raspberrypi.com/products/raspberry-pi-5/) with a [AI Hat +](https://www.raspberrypi.com/products/ai-hat/)