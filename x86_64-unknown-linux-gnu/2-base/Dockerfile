ARG FROM_IMAGE_PREFIX
FROM $FROM_IMAGE_PREFIX AS prefix

ARG TARGET
ENV TARGET=$TARGET

# TODO use target env when copy will support variables expansion.
FROM scratch
COPY --from=prefix /usr/x86_64-unknown-linux-gnu/ /
COPY root /

# All packages may depend on gzip and diffutils silently.
RUN env-update && \
  python3.9 -c "import lib2to3.pygram" && \
  eselect profile set default/linux/amd64/17.1/no-multilib && \
  echo "" > /var/lib/portage/world && \
  build.sh -v1 sys-apps/baselayout && \
  env-update && source /etc/profile && \
  USE="-nls" build.sh -v1 app-arch/gzip sys-apps/diffutils && \
  locale-gen

# TODO remove this workaround after https://github.com/gentoo/gentoo/pull/9822 will be merged
#  and https://bugs.gentoo.org/705970 will be fixed.
RUN PYTHON_TARGETS="python3_9" USE="-nls -rsync-verify" build.sh -v1 \
  dev-lang/python-exec sys-apps/portage
# TODO end of workaround

RUN cleanup.sh
