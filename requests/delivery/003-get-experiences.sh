#!/bin/zsh

site_id=$(DB_NAME="lp3" site_friendly_url='/guest'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select groupId from Group_ where friendlyURL = '${site_friendly_url}'";);
#page_friendly_url='/x/y/z';
page_friendly_url='x/y/z';

echo "*************************************************************************"
echo "* Get Experiences. Retrieve only experience key and name and segment"
echo "* name fields using query parameter 'fields' "
echo "*************************************************************************"

set -x

curl -s -X 'GET' "http://localhost:8083/o/headless-delivery/v1.0/sites/${site_id}/site-pages/${page_friendly_url}/experiences?fields=experience.key,experience.name,experience.segments.name" \
  -H 'Accept-Language: en-US' \
  -u 'test@liferay.com:test' \
  | jq '.'

{ set +x; } 2>/dev/null