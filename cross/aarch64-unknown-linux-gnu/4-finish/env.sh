#!/bin/bash
set -e

DIR=$(dirname "${BASH_SOURCE[0]}")
source "${DIR}/../../../env.sh"

FROM_IMAGE_NAME="${IMAGE_PREFIX}_aarch64-unknown-linux-gnu_world"
IMAGE_NAME="${IMAGE_PREFIX}_aarch64-unknown-linux-gnu"
