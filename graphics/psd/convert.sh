#!/bin/bash

set -e

convert hr-biter-radar-shadow.psd[0] hr-biter-radar-shadow.png
convert -repage 1568x2032 hr-biter-radar.psd[1] hr-biter-radar.psd[2] -background transparent -flatten png8:hr-biter-radar-idle.png
convert hr-biter-radar.psd[0] png8:hr-biter-radar.png
convert hr-biter-radar.png -resize '>784x1016' png8:biter-radar.png
convert hr-biter-radar-idle.png -resize '>784x1016' png8:biter-radar-idle.png
convert hr-biter-radar-shadow.png -resize '1368x744!' -define png:bit-depth=8 biter-radar-shadow.png
convert biter-research-icon.psd[0] png8:biter-research-icon.png
