#!/bin/bash
cd bitcoin-lib
mvn install -DskipTests
mvn clean
cd ..
cd eclair
mvn install -DskipTests
mvn clean
cd ..
