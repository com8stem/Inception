#!/bin/bash

mysql_install_db


# MariaDB サービスを一度停止（設定変更のため）
/etc/init.d/mariadb stop

# 例: 50-server.cnf 内の bind-address 行をコメントアウトしてリモートからの接続を許可する
sed -i 's/^bind-address/#bind-address/g' /etc/mysql/mariadb.conf.d/50-server.cnf

# 最終的に、渡されたコマンド（引数がなければデフォルトで mysqld が起動）を実行
exec mysqld 
