[![Docker Image CI](https://github.com/majamee/auto-dash-hls/actions/workflows/docker-image.yml/badge.svg?branch=jpg-thumbnails)](https://github.com/majamee/auto-dash-hls/actions/workflows/docker-image.yml) | 
[![Docker Stars](https://img.shields.io/docker/stars/majamee/auto-dash-hls.svg?style=social)](https://hub.docker.com/r/majamee/auto-dash-hls/?target=_blank) [![Docker Pulls](https://img.shields.io/docker/pulls/majamee/auto-dash-hls.svg?style=social)](https://hub.docker.com/r/majamee/auto-dash-hls/?target=_blank)

# Auto Dash HLS
Automated toolchain for generating DASH/ HLS compatible files from all videos inside a root folder.

Recommended usage via Docker [Docker Desktop](https://www.docker.com/products/docker-desktop/?target=_blank) & [Docker Hub](https://hub.docker.com/r/majamee/auto-dash-hls/).

## Usage
Prerequisite: [Docker](https://www.docker.com/) needs to be installed and running.

```sh
docker pull majamee/auto-dash-hls
docker run -v /absolute/path/to/video/:/video majamee/auto-dash-hls
```
Please just replace in the command above the absolute path to your video file folder and all videos inside (recursive) will be converted to web-optimized DASH/ HLS compatible files (protected against up-scaling). You can also use [tags](https://hub.docker.com/r/majamee/auto-dash-hls/tags/) like `majamee/auto-dash-hls:edge` (e.g. uses [alpine](https://hub.docker.com/_/alpine/)'s edge version as base).

Folders can not be named `output` within the transcoding folder as folders named `output` are skipped to prevent re-encoding already encoded videos.

## Features
* Creates DASH (VOD) compatible files (including Safari on Mac)
* Creates HLS files for compatibility with Safari on iOS
* Optimizes video files for web playback (`moov` atom)
* Compresses videos using H.264@CRF22 (for best compatibility)
* Compresses audio using AAC@128k (for DASH as separate track to save data)
* Creates automatically 3 quality levels (Full HD/ HD/ DVD quality)
* Fragments video files in 2 second windows to allow dynamic quality switching based on available bandwidth
* Creates master MPD-Playlist which connects everything (MPEG-DASH)
* Creates master M3U8-Playlist for HLS
* Automatically scans the folder recursively for supported video files for transcoding
* Creates `.auto-hls-dash` file in provided root directory for file skipping in sub-sequent calls
* Creates all output files neatly stored in a sub-folder matching the video file name in the folder `output` next to the transcoded video file
* Adds also HTML and `.htaccess` file including code ready for inclusion into the own website for playback next to all other created files
* Included fallback player (`plyr.html`) is based on the great work of the guys at [Plyr](https://plyr.io/) 
* Included second fallback player (`fluid-player.html`) is based on the great work of the guys at [Fluid Player](https://github.com/fluid-player/fluid-player) 
* Included player (`index.html`) is based on the great work of the guys at [Video.js](http://videojs.com/) 

# Demo
[https://majamee.de/demos](https://majamee.de/demos/?target=_blank)
