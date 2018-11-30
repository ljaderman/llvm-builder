#!/usr/bin/env bash
set -ex

rm -rf deploy
mkdir -p deploy

(cd linux && ./build.sh )
cp linux/out/solana-llvm-linux.tgz deploy

if [ "$(uname)" == "Darwin" ]; then
  (cd macos && ./build.sh )
  cp macos/out/solana-llvm-macos.tgz deploy
else
  echo Cannot build for MacOS, skipping
fi

