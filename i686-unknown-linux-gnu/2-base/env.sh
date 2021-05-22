#!/usr/bin/env bash
set -e

DIR=$(dirname "${BASH_SOURCE[0]}")
source "${DIR}/../env.sh"

FROM_IMAGE_PREFIX="${IMAGE_PREFIX}_${TARGET}_prefix"

IMAGE_BUILD_ARGS="FROM_IMAGE_PREFIX TARGET"
IMAGE_NAME="${IMAGE_PREFIX}_${TARGET}_base"
# TODO replace with i686 when https://github.com/containers/buildah/issues/3252 will be fixed.
IMAGE_PLATFORM="linux/amd64"
IMAGE_LAYERS="false"
