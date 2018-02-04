#!/usr/bin/env bash
set -x -e

# Make sure we have the latest version of the image
docker pull simonvanderveldt/rpi3-kernel-builder

# run build
docker run --rm -ti \
  -v "${PWD}/linux":/workdir/linux \
  -v "${PWD}/build":/workdir/build \
  -v "${PWD}/configs/bcm2709stripped_defconfig":/workdir/bcm2709stripped_defconfig \
  -v "${PWD}/patches":/workdir/patches \
  -v "${PWD}/rt-patches":/workdir/rt-patches \
  -v "${PWD}/monome-snd":/workdir/monome-snd \
  -v "${PWD}/ssd1332":/workdir/ssd1332 \
  -e DEFCONFIG_PATH=/workdir/bcm2709stripped_defconfig \
  -e "PATCH_DIRS=/workdir/rt-patches /workdir/patches /workdir/monome-snd /workdir/ssd1332" \
  simonvanderveldt/rpi3-kernel-builder
