#!/bin/bash

[ -z "$1" ] && (
echo "usage: "
echo "$0 help"
) && exit 1

CURL="curl -s -X POST"
TARGET="http://localhost:8087"
JSON="Content-Type: application/json"
JQ="jq"

set -e
#set -x

case $1 in
"help")
  $CURL -H "$JSON" -d '{ "method": "help", "params" : [] }' $TARGET | $JQ
  ;;
"peers")
  $CURL -H "$JSON" -d '{ "method": "peers", "params" : [] }' $TARGET | $JQ
  ;;
"channels")
  $CURL -H "$JSON" -d '{ "method": "channels", "params" : [] }' $TARGET | $JQ
  ;;
"network")
  $CURL -H "$JSON" -d '{ "method": "network", "params" : [] }' $TARGET | $JQ
  ;;
"connect")
  # host, port, nodeId
  $CURL -H "$JSON" -d \
  '{ "method": "connect", "params" : ["'$2'", '$3', "'$4'"] }' \
  $TARGET | $JQ
  ;;
"channel")
  # channelId
  $CURL -H "$JSON" -d \
  '{ "method": "channel", "params" : ["'$2'"] }' \
  $TARGET | $JQ
  ;;
"receive")
  # amountMsat TODO not work
  $CURL -H "$JSON" -d \
  '{ "method": "receive", "params" : ['$2'] }' \
  $TARGET | $JQ
  ;;
"close")
  # channelId
  # TODO channelId, scriptPubKey
  $CURL -H "$JSON" -d \
  '{ "method": "close", "params" : ["'$2'"] }' \
  $TARGET | $JQ
  ;;
"open")
  # host, port, nodeId, fundingSatoshi, pushMsat
  $CURL -H "$JSON" -d \
  '{ "method": "addhtlc", "params" : ["'$2'", '$3', "'$4'", '$5', '$6'] }' \
  $TARGET | $JQ
  ;;
"send")
  # amountMsat, paymentHash, nodeId
  $CURL -H "$JSON" -d \
  '{ "method": "addhtlc", "params" : ['$2', "'$3'", "'$4'"] }' \
  $TARGET | $JQ
  ;;
esac
echo
