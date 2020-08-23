#!/bin/bash

# We need up to 1000 MB (less than 1GB) per thread.
MAX_THREADS=$(($(getconf _PHYS_PAGES) * $(getconf PAGE_SIZE) / (1000 ** 3)))
EFFECTIVE_THREADS=$(getconf _NPROCESSORS_ONLN)

THREADS=$((MAX_THREADS < EFFECTIVE_THREADS ? MAX_THREADS : EFFECTIVE_THREADS))
JOBS=$((MAX_THREADS / THREADS))

export MAKEOPTS="--jobs=$THREADS"
export EMERGE_DEFAULT_OPTS="--jobs=$JOBS"
