#!/bin/bash
set -e

source libs/env_deploy.sh
ENV_NEKORAY=1
source libs/get_source_env.sh
pushd ..

####

if [ ! -d "sing-box" ]; then
  git clone --no-checkout https://github.com/MatsuriDayo/sing-box.git
fi
pushd sing-box
git checkout "$COMMIT_SING_BOX"

# XHTTP transport (from hiddify-sing-box), see patches/sing-box-xhttp.patch
if git apply --reverse --check "$SRC_ROOT/patches/sing-box-xhttp.patch" >/dev/null 2>&1; then
  echo "sing-box: xhttp patch already applied"
elif git apply --check "$SRC_ROOT/patches/sing-box-xhttp.patch" >/dev/null 2>&1; then
  git apply "$SRC_ROOT/patches/sing-box-xhttp.patch"
  echo "sing-box: xhttp patch applied"
else
  echo "sing-box: FAILED to apply patches/sing-box-xhttp.patch" >&2
  exit 1
fi

popd

####

if [ ! -d "sing-quic" ]; then
  git clone --no-checkout https://github.com/MatsuriDayo/sing-quic.git
fi
pushd sing-quic
git checkout "$COMMIT_SING_QUIC"

popd

####

if [ ! -d "libneko" ]; then
  git clone --no-checkout https://github.com/MatsuriDayo/libneko.git
fi
pushd libneko
git checkout "$COMMIT_LIBNEKO"

popd

####

popd
