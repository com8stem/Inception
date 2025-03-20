#!/bin/bash

# エラーが発生したらスクリプトを終了
set -e

# MariaDB サーバーをバックグラウンドで起動
mariadbd &
sleep 5

mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';"
mysql -u root -p"$MYSQL_ROOT_PASSWORD" -e "FLUSH PRIVILEGES;"

# MariaDB サービスを一度停止（設定変更のため）
/etc/init.d/mariadb stop

# 例: 50-server.cnf 内の bind-address 行をコメントアウトしてリモートからの接続を許可する
sed -i 's/^bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# 最終的に、渡されたコマンド（引数がなければデフォルトで mysqld が起動）を実行
exec mysqld
