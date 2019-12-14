#!/bin/bash
set -e

cd "$(dirname $0)"

git remote add github    "git@github.com:andrew-aladev/test-images.git"    || true
git remote add bitbucket "git@bitbucket.org:andrew-aladev/test-images.git" || true
git remote add gitlab    "git@gitlab.com:andrew-aladev/test-images.git"    || true
