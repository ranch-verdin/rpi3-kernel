#!/usr/bin/env bash
set -e

# # Exit if not running on Travis
# if [ -z "$TRAVIS_BRANCH" ]; then
#   echo "ABORTING: This script is meant for usage on Travis-CI only"
#   exit 1
# fi
#
# # Check essential envs
# if [ -z "$GITHUB_TOKEN" ]; then
#   echo "ABORTING: env GITHUB_TOKEN is missing"
#   exit 1
# fi

# Show commands being run from here on
set -x

# run build
docker run --rm -ti \
  -v "${PWD}/linux":/workdir/linux \
  -v "${PWD}/build":/workdir/build \
  simonvanderveldt/rpi3-kernel-builder

# # deploy to GitHub releases
# export GIT_TAG=v$BUILD_NR
# export GIT_RELTEXT="Auto-released by [Travis-CI build #$TRAVIS_BUILD_NUMBER](https://travis-ci.org/$TRAVIS_REPO_SLUG/builds/$TRAVIS_BUILD_ID)"
# curl -sSL https://github.com/tcnksm/ghr/releases/download/v0.5.4/ghr_v0.5.4_linux_amd64.zip > ghr.zip
# unzip ghr.zip
# ./ghr --version
# ./ghr --debug -u DieterReuter -b "$GIT_RELTEXT" $GIT_TAG builds/$BUILD_NR/
