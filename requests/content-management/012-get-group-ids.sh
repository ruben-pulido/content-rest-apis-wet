#!/bin/zsh

sites=$(DB_NAME="lp$1" site_friendly_url="/$2"; export MYSQL_PWD=test; mysql -N -s --port=3306 --host=127.0.0.1 -uroot -e "use ${DB_NAME}; select friendlyURL, groupKey, groupId from Group_";);

echo "sites: $sites"