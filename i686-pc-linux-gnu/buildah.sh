#!/bin/bash
set -e

cd "$(dirname $0)"

source "../env.sh"
source "../utils.sh"

DOCKER_IMAGE="${DOCKER_IMAGE_PREFIX}_i686-pc-linux-gnu"

CONTAINER=$(buildah from "docker.io/gentoo/stage3-x86:latest")
buildah config --label maintainer="$MAINTAINER" "$CONTAINER"

run rm -r /usr/share/{doc,man,info}
copy root/ /

run chown -R portage:portage /usr/portage
run emerge-webrsync

run eselect profile set default/linux/x86/17.0
run "source /etc/profile && env-update"

build emerge -v1 sys-devel/gcc sys-devel/binutils sys-libs/glibc
build emerge -ve @world
build emerge -v app-portage/gentoolkit
build emerge -v clang

build "update && upgrade && cleanup"

run rm -rf /etc/._cfg*
run eselect news read

commit