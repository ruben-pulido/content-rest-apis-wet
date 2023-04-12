#!/bin/zsh

site_id=$(DB_NAME="lp2" site_friendly_url='/guest'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select groupId from Group_ where friendlyURL = '${site_friendly_url}'";);

echo "*************************************************************************"
echo "* Post Site Page "
echo "*************************************************************************"

set -x
curl -s -X 'POST' "http://localhost:8080/o/headless-delivery/v1.0/sites/${site_id}/site-pages" \
  -d  @$1 \
  -H 'Accept-Language: en-US, es-ES' \
  -H 'Content-Type: application/json' \
  -u 'test@liferay.com:test' \
  | jq '.'

{ set +x; } 2>/dev/null