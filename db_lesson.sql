CREATE TABLE departments (
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DESC departments;
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type         | Null | Key | Default           | Extra                                         |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| department_id | int unsigned | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)  | NO   |     | NULL              |                                               |
| created_at    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+


ALTER TABLE people
ADD COLUMN department_id INT(10) UNSIGNED AFTER email;

DESC people;
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type             | Null | Key | Default           | Extra                                         |
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+
| person_id     | int unsigned     | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)      | NO   |     | NULL              |                                               |
| email         | varchar(255)     | YES  | UNI | NULL              |                                               |
| department_id | int unsigned     | YES  |     | NULL              |                                               |
| age           | tinyint unsigned | YES  |     | NULL              |                                               |
| gender        | tinyint          | YES  |     | NULL              |                                               |
| created_at    | timestamp        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp        | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+------------------+------+-----+-------------------+-----------------------------------------------+



INSERT INTO departments (name) VALUES
(‘営業‘),
(‘開発‘),
(‘経理‘),
(‘人事‘),
(‘情報システム‘);

SELECT * FROM departments;
+---------------+--------------------+---------------------+---------------------+
| department_id | name               | created_at          | updated_at          |
+---------------+--------------------+---------------------+---------------------+
|             1 | 営業               | 2025-09-18 10:55:19 | 2025-09-18 10:55:19 |
|             2 | 開発               | 2025-09-18 10:55:19 | 2025-09-18 10:55:19 |
|             3 | 経理               | 2025-09-18 10:55:19 | 2025-09-18 10:55:19 |
|             4 | 人事               | 2025-09-18 10:55:19 | 2025-09-18 10:55:19 |
|             5 | 情報システム       | 2025-09-18 10:55:19 | 2025-09-18 10:55:19 |
+---------------+--------------------+---------------------+---------------------+


INSERT INTO people (name, email, department_id)
VALUES
(‘山田太郎‘, 'yamada.taro@example.com', 1),
(‘佐藤花子’, 'sato.hanako@example.com', 1),
(‘鈴木次郎’, 'suzuki.jiro@example.com', 1),
(‘高橋美咲’, 'takahashi.misaki@example.com', 2),
(‘田中健’, 'tanaka.ken@example.com', 2),
(‘伊藤梨花’, 'ito.rika@example.com', 2),
(‘中村亮’, 'nakamura.ryo@example.com', 2),
(‘小林恵子’, 'kobayashi.keiko@example.com', 3),
(‘加藤雄大’, 'kato.yudai@example.com', 4),
(‘松本彩’, 'matsumoto.aya@example.com', 5);

SELECT name,email, department_id FROM people;
+-----------------------+------------------------------+---------------+
| name                  | email                        | department_id |
+-----------------------+------------------------------+---------------+
| 鈴木たかし            | suzuki@beyond-works.co.jp    |             1 |
| 田中ゆうこ            | tanaka@beyond-works.co.jp    |             1 |
| 福田だいすけ          | fukuda@beyond-works.co.jp    |             1 |
| 豊島はなこ            | toyoshima@beyond-works.co.jp |             2 |
| 不思議沢みちこ        | NULL                         |             2 |
| 山田太郎              | yamada.taro@example.com      |             1 |
| 佐藤花子              | sato.hanako@example.com      |             1 |
| 鈴木次郎              | suzuki.jiro@example.com      |             1 |
| 高橋美咲              | takahashi.misaki@example.com |             2 |
| 田中健                | tanaka.ken@example.com       |             2 |
| 伊藤梨花              | ito.rika@example.com         |             2 |
| 中村亮                | nakamura.ryo@example.com     |             2 |
| 小林恵子              | kobayashi.keiko@example.com  |             3 |
| 加藤雄大              | kato.yudai@example.com       |             4 |
| 松本彩                | matsumoto.aya@example.com    |             5 |
+-----------------------+------------------------------+---------------+
15 rows in set (0.00 sec)



INSERT INTO reports (person_id, content)
VALUES
(1, 'reports0001'),
(2, 'reports0002'),
(3, 'reports0003'),
(4, 'reports0004'),
(5, 'reports0005'),
(6, 'reports0006'),
(7, 'reports0007'),
(8, 'reports0008'),
(9, 'reports0009'),

SELECT person_id, content FROM reports;
+-----------+-------------+
| person_id | content     |
+-----------+-------------+
|         2 | 日報1       |
|         3 | 日報2       |
|         4 | 日報3       |
|         6 | 日報4       |
|         2 | 日報5       |
|         3 | 日報6       |
|         4 | 日報7       |
|         6 | 日報8       |
|         2 | 日報9       |
|         3 | 日報10      |
|        10 | 日報11      |
|         1 | reports0001 |
|         2 | reports0002 |
|         3 | reports0003 |
|         4 | reports0004 |
|         5 | reports0005 |
|         6 | reports0006 |
|         7 | reports0007 |
|         8 | reports0008 |
|         9 | reports0009 |
|        10 | reports0010 |
+-----------+-------------+


UPDATE people
SET department_id = 1
WHERE person_id = 1;

UPDATE people
SET department_id = 1
WHERE person_id = 2;

UPDATE people
SET department_id = 1
WHERE person_id = 3;

UPDATE people
SET department_id = 2
WHERE person_id IN (4, 6);

SELECT person_id, name, department_id FROM people;
+-----------+-----------------------+---------------+
| person_id | name                  | department_id |
+-----------+-----------------------+---------------+
|         1 | 鈴木たかし            |             1 |
|         2 | 田中ゆうこ            |             1 |
|         3 | 福田だいすけ          |             1 |
|         4 | 豊島はなこ            |             2 |
|         6 | 不思議沢みちこ        |             2 |
|         7 | 山田太郎              |             1 |
|         8 | 佐藤花子              |             1 |
|         9 | 鈴木次郎              |             1 |
|        10 | 高橋美咲              |             2 |
|        11 | 田中健                |             2 |
|        12 | 伊藤梨花              |             2 |
|        13 | 中村亮                |             2 |
|        14 | 小林恵子              |             3 |
|        15 | 加藤雄大              |             4 |
|        16 | 松本彩                |             5 |
+-----------+-----------------------+---------------+
15 rows in set (0.00 sec)



SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;

+--------------------+------+
| name               | age  |
+--------------------+------+
| 福田だいすけ       |   42 |
| 鈴木たかし         |   20 |
+--------------------+------+

-- Q6: peopleテーブルからdepartment_idが1のレコードを取得し、
-- name, email, ageカラムを抽出。created_atカラムで昇順に並べ替え。

SELECT`name`, `email`, `age`
FROM `people`
WHERE `department_id` = 1
ORDER BY `created_at`;

+--------------------+---------------------------+------+
| name               | email                     | age  |
+--------------------+---------------------------+------+
| 鈴木たかし         | suzuki@beyond-works.co.jp |   20 |
| 田中ゆうこ         | tanaka@beyond-works.co.jp |   25 |
| 福田だいすけ       | fukuda@beyond-works.co.jp |   42 |
| 山田太郎           | yamada.taro@example.com   | NULL |
| 佐藤花子           | sato.hanako@example.com   | NULL |
| 鈴木次郎           | suzuki.jiro@example.com   | NULL |
+--------------------+---------------------------+------+

SELECT name
FROM people
WHERE (age BETWEEN 20 AND 29 AND gender = 2)
OR (age BETWEEN 40 AND 49 AND gender = 1);

+--------------------+
| name               |
+--------------------+
| 田中ゆうこ           |
| 福田だいすけ         |
+--------------------+


SELECT *
FROM people
WHERE department_id = 1
ORDER BY age ASC;

+-----------+--------------------+---------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name               | email                     | department_id | age  | gender | created_at          | updated_at          |
+-----------+--------------------+---------------------------+---------------+------+--------+---------------------+---------------------+
|         7 | 山田太郎           | yamada.taro@example.com   |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:47:36 |
|         8 | 佐藤花子           | sato.hanako@example.com   |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|         9 | 鈴木次郎           | suzuki.jiro@example.com   |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|         1 | 鈴木たかし         | suzuki@beyond-works.co.jp |             1 |   20 |      1 | 2025-09-17 11:52:40 | 2025-09-18 11:41:19 |
|         2 | 田中ゆうこ         | tanaka@beyond-works.co.jp |             1 |   25 |      2 | 2025-09-17 11:52:40 | 2025-09-18 11:41:34 |
|         3 | 福田だいすけ       | fukuda@beyond-works.co.jp |             1 |   42 |      1 | 2025-09-17 11:52:40 | 2025-09-18 11:41:43 |
+-----------+--------------------+---------------------------+---------------+------+--------+---------------------+---------------------+


SELECT AVG(age) AS average_age
FROM people
WHERE department_id = 2
AND gender = 2;

+-------------+
| average_age |
+-------------+
|     34.0000 |
+-------------+


SELECT p.name, d.name AS department_name, r.content AS report_content
FROM people p
INNER JOIN departments d ON p.department_id = d.department_id
INNER JOIN reports r ON p.person_id = r.person_id;

+-----------------------+-----------------+----------------+
| name                  | department_name | report_content |
+-----------------------+-----------------+----------------+
| 鈴木次郎              | 営業            | reports0009    |
| 佐藤花子              | 営業            | reports0008    |
| 山田太郎              | 営業            | reports0007    |
| 福田だいすけ          | 営業            | reports0003    |
| 田中ゆうこ            | 営業            | reports0002    |
| 鈴木たかし            | 営業            | reports0001    |
| 福田だいすけ          | 営業            | 日報10         |
| 田中ゆうこ            | 営業            | 日報9          |
| 福田だいすけ          | 営業            | 日報6          |
| 田中ゆうこ            | 営業            | 日報5          |
| 福田だいすけ          | 営業            | 日報2          |
| 田中ゆうこ            | 営業            | 日報1          |
| 高橋美咲              | 開発            | reports0010    |
| 不思議沢みちこ        | 開発            | reports0006    |
| 豊島はなこ            | 開発            | reports0004    |
| 高橋美咲              | 開発            | 日報11         |
| 不思議沢みちこ        | 開発            | 日報8          |
| 豊島はなこ            | 開発            | 日報7          |
| 不思議沢みちこ        | 開発            | 日報4          |
| 豊島はなこ            | 開発            | 日報3          |
+-----------------------+-----------------+----------------+


SELECT p.name
FROM people p
LEFT JOIN reports r
ON p.person_id = r.person_id
WHERE r.report_id IS NULL;

+--------------+
| name         |
+--------------+
| 田中健       |
| 伊藤梨花     |
| 中村亮       |
| 小林恵子     |
| 加藤雄大     |
| 松本彩       |
+--------------+
