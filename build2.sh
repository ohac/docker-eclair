#!/bin/bash
cd bitcoin-lib
mvn install -DskipTests
cd ..
cd eclair
mvn pakcage -DskipTests
cd ..
