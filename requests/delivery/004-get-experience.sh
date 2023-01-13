#!/bin/zsh

site_id=$(DB_NAME="lp2" site_friendly_url='/mc1'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select groupId from Group_ where friendlyURL = '${site_friendly_url}'";);
page_friendly_url='/my-learning';
experience_name='Advanced Users Experience';
output_file='/tmp/experience.json';

echo "*************************************************************************"
echo "* Get Experience "
echo "*************************************************************************"

rm -f ${output_file};

experience_key=$(curl -s -X GET 'http://localhost:8080/o/headless-delivery/v1.0/sites/141521/site-pages//my-learning/experiences?fields=experience.key,experience.name,experience.segments.name' -H 'Accept-Language: en-US' -u test@liferay.com:test | jq -r --arg experience_name "${experience_name}" '.items[0] | select(.experience.name==$experience_name) | .experience.key');

echo "Experience with name '${experience_name}' has experience_key: ${experience_key}";

set -x

curl -s -X 'GET' "http://localhost:8080/o/headless-delivery/v1.0/sites/${site_id}/site-pages/${page_friendly_url}/experiences/${experience_key}?fields=experience,pageDefinition.pageElement" \
  -H 'Accept-Language: en-US' \
  -u 'test@liferay.com:test' | tee ${output_file} | jq '.'

{ set +x; } 2>/dev/null

idea ${output_file};

