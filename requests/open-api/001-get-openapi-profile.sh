#!/bin/zsh

echo "*************************************************************************"
echo "* Get openapi profile "
echo "*************************************************************************"

set -x
curl -s -X 'GET' "http://localhost:8080/o/openapi/openapi.json" \
  -H 'Accept-Language: en-US' \
  -u 'test@liferay.com:test' \
  | jq '.'

{ set +x; } 2>/dev/null