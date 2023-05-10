#!/bin/zsh

site_id=$(DB_NAME="lp3" site_friendly_url='/guest'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select groupId from Group_ where friendlyURL = '${site_friendly_url}'";);

echo "site_id: $site_id"

taxonomyVocabularyId="$(curl -s -X 'GET' "http://localhost:8080/o/headless-admin-taxonomy/v1.0/sites/${site_id}/taxonomy-vocabularies"\
  -H 'Accept-Language: en-US' \
  -u 'test@liferay.com:test' \
  | jq '.items[0].id')";

echo "taxonomyVocabularyId: #$taxonomyVocabularyId#";

echo "*************************************************************************"
echo "* Get taxonomy vocabularies permissions "
echo "*************************************************************************"

set -x
curl -s -X 'GET' "http://localhost:8080/o/headless-admin-taxonomy/v1.0/taxonomy-vocabularies/${taxonomyVocabularyId}/permissions" \
  -H 'Accept-Language: en-US' \
  -u 'test@liferay.com:test' \
  | jq '.'

{ set +x; } 2>/dev/null