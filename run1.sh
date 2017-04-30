#!/bin/bash
cp -f run2.sh data/
docker run -it --rm \
  -v $PWD/data:/data \
  -v $PWD/dot.eclair:/root/.eclair \
  --net container:monacoin \
  eclair bash
