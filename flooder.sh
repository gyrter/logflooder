#!/bin/bash

NAMESPACE=${KUBERNETES_NAMESPACE:-default}
TZ=${TIMEZONE:-UTC}
FLOOD_DELAY=${DELAY:-10}
FLOOD_RANDOM=${RANDOM:-5}
TYPE=${LOG_TYPE:-plain}
MESSAGE=${LOG_STRING}

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
  echo "$(date) generate '$(message)' for host ${HOSTNAME} in NS ${NAMESPACE}"
}


while true; do
  sleep $(( $RANDOM % $FLOOD_DELAY + 1 ))
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
