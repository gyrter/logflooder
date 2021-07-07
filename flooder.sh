#!/bin/bash

#set -x

NAMESPACE=${KUBERNETES_NAMESPACE:-default}
TZ=${TIMEZONE:-UTC}
FLOOD_DELAY=${DELAY:-10}
FLOOD_RANDOM=${RND:-5}
TYPE=${LOG_TYPE:-plain}
MESSAGE=${LOG_STRING}
USE_DECOR=${DECORATE:-1}

export LC_ALL=C
export TZ=$TZ

case $TYPE in
  plain|json)
    ;;
  *)
    echo "Wrong log type"
    exit 1
    ;;
esac

function message(){
  if [ -z $MESSAGE ]; then
    echo $(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)
  else
    echo $MESSAGE
  fi
}

function print_json(){
    echo "{\"time\": $(date +%s), \"msg\": \"$(message)\", \"host\": \"${HOSTNAME}\", \"namespace\": \"${NAMESPACE}\"}"
}

function print_plain(){
  if [ x${USE_DECOR} = x1 ]; then
    printf "$(date) generate '$(message)' for host ${HOSTNAME} in NS ${NAMESPACE}\n"
  else
    printf "$(message)\n"
  fi
}


while true; do
  if [ ! x$FLOOD_RANDOM == x0 ]; then
    sleep $(( $RANDOM % $FLOOD_RANDOM + 1 ))
  fi
  case $TYPE in
    plain)
      print_plain
      ;;
    json)
      print_json
      ;;
  esac
  sleep $FLOOD_DELAY
done
