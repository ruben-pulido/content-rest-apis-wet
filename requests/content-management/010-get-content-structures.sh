#!/bin/zsh

site_id=$(DB_NAME="lp2" site_friendly_url='/global'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select groupId from Group_ where friendlyURL = '${site_friendly_url}'";);

echo "site_id: $site_id"

echo "*************************************************************************"
echo "* Get Content Structures"
echo "*************************************************************************"

set -x
curl -s -X 'GET' "http://localhost:8082/o/headless-delivery/v1.0/sites/${site_id}/content-structures?fields=name,id,externalReferenceCode" \
  -H 'Accept-Language: en-US' \
  -u 'test@liferay.com:test' \
  | jq '.'

{ set +x; } 2>/dev/null