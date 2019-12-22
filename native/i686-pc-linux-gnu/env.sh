#!/bin/bash
set -e

DIR=$(dirname "${BASH_SOURCE[0]}")
source "${DIR}/../../env.sh"

FROM_IMAGE_NAME="docker.io/gentoo/stage3-x86"
IMAGE_NAME="${IMAGE_PREFIX}_i686-pc-linux-gnu"
