#!/bin/zsh

site_id=$(DB_NAME="lp2" site_friendly_url='/guest'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select groupId from Group_ where friendlyURL = '${site_friendly_url}'";);
external_reference_code='y/z';
#external_reference_code='y%2Fz';

echo "*************************************************************************"
echo "* Get Blog Posting by External Reference Code "
echo "*************************************************************************"

set -x

curl -s -X 'GET' "http://localhost:8082/o/headless-delivery/v1.0/sites/${site_id}/blog-postings/by-external-reference-code-query-param?externalReferenceCode=${external_reference_code}" \
  -H 'Accept-Language: en-US' \
  -u 'test@liferay.com:test'
#  \
#  | jq '.'

{ set +x; } 2>/dev/null