-- データベースとユーザーが存在する場合のみ削除
DROP DATABASE IF EXISTS db;
DROP USER IF EXISTS 'user'@'%';

-- ユーザーの作成
CREATE USER 'user'@'%' IDENTIFIED BY 'pass';

-- データベースの作成
CREATE DATABASE db;

-- データベースの選択
USE db;

-- ユーザーに権限を付与
GRANT ALL PRIVILEGES ON db.* TO 'user'@'%';

-- usersテーブルの作成
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    registration_date DATE NOT NULL
);

-- usersサンプルデータの挿入
INSERT INTO users (name, email, registration_date) VALUES
('山田太郎', 'yamada@example.com', '2023-01-15'),
('佐藤花子', 'sato@example.com', '2023-02-20'),
('鈴木一郎', 'suzuki@example.com', '2023-03-10'),
('田中美咲', 'tanaka@example.com', '2023-04-05'),
('高橋健太', 'takahashi@example.com', '2023-05-12'),
('伊藤由美', 'ito@example.com', '2023-06-18'),
('渡辺隆', 'watanabe@example.com', '2023-07-22'),
('小林明', 'kobayashi@example.com', '2023-08-30');

CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO categories (name) VALUES
('電子機器'), ('ファッション'), ('家電'), ('書籍'), ('スポーツ用品');

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    category_id INT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

INSERT INTO products (name, category_id, price, stock) VALUES
('スマートフォン', 1, 80000, 50),
('ノートパソコン', 1, 120000, 30),
('ワイヤレスイヤホン', 1, 15000, 100),
('Tシャツ', 2, 2500, 200),
('ジーンズ', 2, 6000, 150),
('スニーカー', 2, 8000, 100),
('冷蔵庫', 3, 85000, 20),
('電子レンジ', 3, 25000, 40),
('小説集', 4, 1500, 300),
('プログラミング入門書', 4, 3000, 150),
('サッカーボール', 5, 4000, 80),
('ヨガマット', 5, 3500, 120);

CREATE TABLE order_statuses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

INSERT INTO order_statuses (name) VALUES
('新規注文'), ('配送済み'), ('キャンセル');

CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    status_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (status_id) REFERENCES order_statuses(id)
);

INSERT INTO orders (user_id, order_date, status_id, total_amount) VALUES
(1, '2023-06-01', 2, 95000),
(2, '2023-06-05', 2, 15000),
(3, '2023-06-10', 2, 128000),
(4, '2023-06-15', 2, 87500),
(5, '2023-06-20', 1, 14000),
(1, '2023-07-01', 2, 35000),
(2, '2023-07-05', 3, 120000),
(3, '2023-07-10', 2, 7500),
(4, '2023-07-15', 2, 12000),
(5, '2023-07-20', 1, 85000),
(1, '2023-08-01', 2, 13000),
(1, '2023-08-15', 2, 30000),
(2, '2023-08-05', 2, 28000),
(2, '2023-08-20', 2, 12000),
(3, '2023-08-10', 2, 5500),
(3, '2023-08-25', 2, 3500);

CREATE TABLE order_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

INSERT INTO order_details (order_id, product_id, quantity, price) VALUES
(1, 1, 1, 80000),
(1, 3, 1, 15000),
(2, 3, 1, 15000),
(3, 2, 1, 120000),
(3, 5, 1, 6000),
(3, 3, 1, 15000),
(4, 7, 1, 85000),
(4, 4, 1, 2500),
(5, 6, 1, 8000),
(5, 5, 1, 6000),
(6, 8, 1, 25000),
(6, 10, 1, 3000),
(6, 11, 1, 4000),
(6, 12, 1, 3500),
(7, 2, 1, 120000),
(8, 9, 5, 1500),
(9, 10, 4, 3000),
(10, 7, 1, 85000),
(11, 4, 2, 2500),
(11, 6, 1, 8000),
(12, 3, 2, 15000),
(13, 8, 1, 25000),
(13, 10, 1, 3000),
(14, 5, 2, 6000),
(15, 9, 1, 1500),
(15, 11, 1, 4000),
(16, 12, 1, 3500);


-- 変更を確定
FLUSH PRIVILEGES;