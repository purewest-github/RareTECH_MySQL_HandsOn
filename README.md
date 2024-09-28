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

---

6. MySQLから出る
```
exit;
```

7. Dockerから出る
```
exit
```

8. Dockerを停止
```
docker compose down -v
```

9. Dockerのクリア
```
docker system prune -a
```