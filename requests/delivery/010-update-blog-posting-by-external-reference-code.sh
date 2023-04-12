#!/bin/zsh

site_id=$(DB_NAME="lp2" site_friendly_url='/guest'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select groupId from Group_ where friendlyURL = '${site_friendly_url}'";);
external_reference_code='f8c7a641-7fd8-d3d0-1064-359c191969bf';

echo "*************************************************************************"
echo "* Update Blog Posting "
echo "*************************************************************************"

set -x
curl -s -X 'PUT' "http://localhost:8082/o/headless-delivery/v1.0/sites/${site_id}/blog-postings/by-external-reference-code/${external_reference_code}" \
  -d  @blog-posting.json \
  -H 'Accept-Language: en-US' \
  -H 'Content-Type: application/json' \
  -u 'test@liferay.com:test' \
  | jq '.'

{ set +x; } 2>/dev/null