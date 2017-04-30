#!/bin/bash
mkdir -p data
cd data
if [ ! -e bitcoin-lib ]; then
git clone https://github.com/monapu/bitcoin-lib.git
fi
if [ ! -e eclair ]; then
git clone https://github.com/ohac/eclair.git
fi
if [ ! -e gui ]; then
mv eclair/eclair-node/src/main/scala/fr/acinq/eclair/gui/ ./
fi
cd ..
docker build -t eclair .
cp -f build2.sh data/
docker run -it --rm \
  -v $PWD/data:/data \
  -v $PWD/dot.eclair:/root/.eclair \
  eclair bash
