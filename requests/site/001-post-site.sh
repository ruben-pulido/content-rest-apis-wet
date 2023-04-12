#!/bin/zsh

echo "*************************************************************************"
echo "* Post Site "
echo "*************************************************************************"

set -x
response=$(curl -s -X 'POST' "http://localhost:8080/o/headless-site/v1.0/sites" \
  -d  @"$1" \
  -H 'X-Liferay-Transaction-Disabled: true' \
  -H 'Accept-Language: en-US' \
  -H 'Content-Type: application/json' \
  -u 'test@liferay.com:test' \
  -w 'SEPARATOR%{response_code}')

{ set +x; } 2>/dev/null

response_body="${response%SEPARATOR*}"
response_code="${response#*SEPARATOR}"

echo "Response Code: ${response_code}";
#   \
echo "$response_body" | jq '.'

