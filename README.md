# MySQLハンズオン

1. Dockerの起動
```
docker compose up -d
```

2. Dockerコンテナに入る
```
docker compose exec db /bin/bash
```

3. MySQLに入る
```
mysql -uroot
```

4. データベース切り替え
```
USE db;
```

5. テーブルを見る
```
SHOW TABLES;
```
