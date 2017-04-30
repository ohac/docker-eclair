#!/bin/bash
cp -f run2.sh data/
docker run -it --rm \
  -v $PWD/data:/data \
  -v $PWD/dot.eclair:/root/.eclair \
  -v $PWD/dot.m2:/root/.m2 \
  --net container:monacoin \
  --name eclair \
  eclair bash -c ./run2.sh
