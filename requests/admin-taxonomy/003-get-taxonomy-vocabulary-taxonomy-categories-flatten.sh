#!/bin/zsh

vocabulary_name='v1';
site_id=$(DB_NAME="lp1" site_friendly_url='/guest'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select groupId from Group_ where friendlyURL = '${site_friendly_url}'";);
vocabulary_id=$(DB_NAME="lp1" site_friendly_url='/guest'; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select vocabularyId from AssetVocabulary where name = '${vocabulary_name}' and groupId = ${site_id}";);

echo "site_id: $site_id"
echo "vocabulary_id: $vocabulary_id"


echo "*************************************************************************"
echo "* Get taxonomy Vocabulary Taxonomy Categories - Flatten"
echo "*************************************************************************"

set -x
#curl -s -X 'GET' "http://localhost:8080/o/headless-admin-taxonomy/v1.0/taxonomy-categories/ranked?siteId=${site_id}&fields=name,parentTaxonomyCategory" \
curl -s -X 'GET' "http://localhost:8080/o/headless-admin-taxonomy/v1.0/taxonomy-vocabularies/${vocabulary_id}/taxonomy-categories?flatten=true&restrictFields=actions,availableLanguages,creator,dateCreated,dateModified,description,externalReferenceCode,siteId,taxonomyCategoryProperties,taxonomyCategoryUsageCount" \
  -H 'Accept-Language: en-US' \
  -u 'test@liferay.com:test' \
  | jq '.'

{ set +x; } 2>/dev/null