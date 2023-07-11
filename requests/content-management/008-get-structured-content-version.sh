#!/bin/zsh

site_id=$(DB_NAME="lp2" site_friendly_url='/guest'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select groupId from Group_ where friendlyURL = '${site_friendly_url}'";);

echo "site_id: $site_id"

echo "*************************************************************************"
echo "* Get Structured Content"
echo "*************************************************************************"

structured_content_id=$(curl -s -X 'GET' -G "http://localhost:8080/o/headless-admin-content/v1.0/sites/${site_id}/structured-contents?flatten=true&fields=id,key,title" --data-urlencode "filter=title eq 'wc1'" \
  -H 'Accept-Language: en-US' \
  -u 'test@liferay.com:test' \
  | jq -s '.[0].items[0].id')

echo "structured_content_id: $structured_content_id"

set -x
curl -s -X 'GET' "http://localhost:8080/o/headless-admin-content/v1.0//structured-contents/${structured_content_id}/by-version/1.1" \
  -H 'Accept-Language: en-US' \
  -u 'test@liferay.com:test' \
  | jq '.'

{ set +x; } 2>/dev/null