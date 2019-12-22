#!/bin/bash
set -e

DIR=$(dirname "${BASH_SOURCE[0]}")
cd "$DIR"

source "../../../utils.sh"
source "./env.sh"

CONTAINER=$(buildah from "$FROM_DOCKER_IMAGE")
buildah config --label maintainer="$MAINTAINER" "$CONTAINER"

build emerge -v app-portage/gentoolkit
build emerge -v clang

build "update && upgrade && cleanup"

run rm -rf /etc/._cfg*
run eselect news read

commit
