#!/bin/zsh

portal_id="3";
portal_port_index="0"
#portal_port_index="$portal_id"

site_id=$(DB_NAME="lp${portal_id}" site_friendly_url='/guest'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select groupId from Group_ where friendlyURL = '${site_friendly_url}'";);
page_friendly_url='layout1';

echo "*************************************************************************"
echo "* Get Site Page Permissions. "
echo "*************************************************************************"

set -x

curl -s -X 'GET' "http://localhost:808${portal_port_index}/o/headless-delivery/v1.0/sites/${site_id}/site-pages/${page_friendly_url}/permissions" \
  -H 'X-Liferay-Accept-All-Languages: true' \
  -u 'test@liferay.com:test' \
  | jq '.'

{ set +x; } 2>/dev/null