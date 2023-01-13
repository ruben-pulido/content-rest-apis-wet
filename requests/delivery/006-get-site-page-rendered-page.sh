#!/bin/zsh

site_id=$(DB_NAME="lp2" site_friendly_url='/mc1'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select groupId from Group_ where friendlyURL = '${site_friendly_url}'";);
page_friendly_url='/my-learning';
output_file='/tmp/page-rendered-page.html';

echo "*************************************************************************"
echo "* Get Site Page Rendered Page. "
echo "*************************************************************************"

rm -f ${output_file};

set -x

curl -s -X 'GET' "http://localhost:8080/o/headless-delivery/v1.0/sites/${site_id}/site-pages/${page_friendly_url}/rendered-page" \
  -H 'Accept-Language: en-US' \
  -u 'test@liferay.com:test' | tee "${output_file}"

"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --new-window --app="file://${output_file}"

{ set +x; } 2>/dev/null

