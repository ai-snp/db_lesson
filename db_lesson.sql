CREATE TABLE departments (
department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(20) NOT NULL,
created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


ALTER TABLE people
ADD COLUMN department_id INT(10) UNSIGNED AFTER email;


INSERT INTO departments (name) VALUES
(‘営業‘),
(‘開発‘),
(‘経理‘),
(‘人事‘),
(‘情報システム‘);


INSERT INTO people (name, email, department_id)
VALUES
(‘山田太郎‘, 'yamada.taro@example.com', 1),
    -> (‘佐藤花子’, 'sato.hanako@example.com', 1),
    -> (‘鈴木次郎’, 'suzuki.jiro@example.com', 1),
    -> (‘高橋美咲’, 'takahashi.misaki@example.com', 2),
    -> (‘田中健’, 'tanaka.ken@example.com', 2),
    -> (‘伊藤梨花’, 'ito.rika@example.com', 2),
    -> (‘中村亮’, 'nakamura.ryo@example.com', 2),
    -> (‘小林恵子’, 'kobayashi.keiko@example.com', 3),
    -> (‘加藤雄大’, 'kato.yudai@example.com', 4),
    -> (‘松本彩’, 'matsumoto.aya@example.com', 5);


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
WHERE person_id IN (4, 5, 6);


SELECT name, age
FROM people
WHERE gender = 1
ORDER BY age DESC;

-- Q6: peopleテーブルからdepartment_idが1のレコードを取得し、
-- name, email, ageカラムを抽出。created_atカラムで昇順に並べ替え。

SELECT`name`, `email`, `age`
FROM `people`
WHERE `department_id` = 1
ORDER BY `created_at`;

SELECT name
FROM people
WHERE (age BETWEEN 20 AND 29 AND gender = 2)
OR (age BETWEEN 40 AND 49 AND gender = 1);


SELECT *
FROM people
WHERE department_id = 1
ORDER BY age ASC;

SELECT AVG(age) AS average_age
FROM people
WHERE department_id = 2
AND gender = 2;


SELECT p.name, d.name AS department_name, r.content AS report_content
FROM people p
INNER JOIN departments d ON p.department_id = d.department_id
INNER JOIN reports r ON p.person_id = r.person_id;


SELECT p.name
FROM people p
LEFT JOIN reports r
ON p.person_id = r.person_id
WHERE r.report_id IS NULL;
