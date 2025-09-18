mysql> USE db_lesson;
Database changed
mysql> SHOW TABLES;
Empty set (0.00 sec)

mysql> CREATE TABLE people (
  -> id INT,
  -> name VARCHAR(255),
  -> email VARCHAR(255),
  -> password CHAR(8)
  -> );
Query OK, 0 rows affected (0.01 sec)

mysql> show tables;
+---------------------+
| Tables_in_db_lesson |
+---------------------+
| people       |
+---------------------+
1 row in set (0.00 sec)

mysql> DESC people;
+----------+--------------+------+-----+---------+-------+
| Field  | Type     | Null | Key | Default | Extra |
+----------+--------------+------+-----+---------+-------+
| id    | int     | YES |   | NULL  |    |
| name   | varchar(255) | YES |   | NULL  |    |
| email  | varchar(255) | YES |   | NULL  |    |
| password | char(8)   | YES |   | NULL  |    |
+----------+--------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> drop table people;
Query OK, 0 rows affected (0.02 sec)

mysql> show tables;
Empty set (0.00 sec)


mysql> CREATE TABLE people(
  -> person_id INT AUTO_INCREMENT PRIMARY KEY,
  -> name VARCHAR(20) NOT NULL,
  -> email VARCHAR(255) UNIQUE,
  -> age INT,
  -> gender TINYINT COMMENT ‘1が男、2が女‘,
  -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
  -> );
Query OK, 0 rows affected (0.01 sec)

mysql> SHOW TABLES;
+---------------------+
| Tables_in_db_lesson |
+---------------------+
| people       |
+---------------------+
1 row in set (0.00 sec)

mysql> desc people;
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field   | Type     | Null | Key | Default      | Extra                     |
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
| person_id | int     | NO  | PRI | NULL       | auto_increment                |
| name    | varchar(20) | NO  |   | NULL       |                        |
| email   | varchar(255) | YES | UNI | NULL       |                        |
| age    | int     | YES |   | NULL       |                        |
| gender   | tinyint   | YES |   | NULL       |                        |
| created_at | timestamp  | YES |   | CURRENT_TIMESTAMP | DEFAULT_GENERATED               |
| updated_at | timestamp  | YES |   | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
7 rows in set (0.00 sec)

mysql> ALTER TABLE people MODIFY age TINYINT UNSIGNED;
Query OK, 0 rows affected (0.03 sec)
Records: 0 Duplicates: 0 Warnings: 0

mysql> DESC people;
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
| Field   | Type       | Null | Key | Default      | Extra                     |
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
| person_id | int       | NO  | PRI | NULL       | auto_increment                |
| name    | varchar(20)   | NO  |   | NULL       |                        |
| email   | varchar(255)   | YES | UNI | NULL       |                        |
| age    | tinyint unsigned | YES |   | NULL       |                        |
| gender   | tinyint     | YES |   | NULL       |                        |
| created_at | timestamp    | YES |   | CURRENT_TIMESTAMP | DEFAULT_GENERATED               |
| updated_at | timestamp    | YES |   | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
7 rows in set (0.01 sec)

mysql> ALTER TABLE people MODIFY person_id INT UNSIGNED;
Query OK, 0 rows affected (0.02 sec)
Records: 0 Duplicates: 0 Warnings: 0

mysql> DESC people;
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
| Field   | Type       | Null | Key | Default      | Extra                     |
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
| person_id | int unsigned   | NO  | PRI | NULL       |                        |
| name    | varchar(20)   | NO  |   | NULL       |                        |
| email   | varchar(255)   | YES | UNI | NULL       |                        |
| age    | tinyint unsigned | YES |   | NULL       |                        |
| gender   | tinyint     | YES |   | NULL       |                        |
| created_at | timestamp    | YES |   | CURRENT_TIMESTAMP | DEFAULT_GENERATED               |
| updated_at | timestamp    | YES |   | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
7 rows in set (0.00 sec)

mysql> ALTER TABLE people MODIFY person_id INT UNSIGNED AUTO_INCREMENT;
Query OK, 0 rows affected (0.02 sec)
Records: 0 Duplicates: 0 Warnings: 0

mysql> desc people;
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
| Field   | Type       | Null | Key | Default      | Extra                     |
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
| person_id | int unsigned   | NO  | PRI | NULL       | auto_increment                |
| name    | varchar(20)   | NO  |   | NULL       |                        |
| email   | varchar(255)   | YES | UNI | NULL       |                        |
| age    | tinyint unsigned | YES |   | NULL       |                        |
| gender   | tinyint     | YES |   | NULL       |                        |
| created_at | timestamp    | YES |   | CURRENT_TIMESTAMP | DEFAULT_GENERATED               |
| updated_at | timestamp    | YES |   | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+------------------+------+-----+-------------------+-----------------------------------------------+
7 rows in set (0.00 sec)



mysql> INSERT INTO people (name,email,age,gender)
  -> VALUES
  -> (‘鈴木たかし’, ‘suzuki@beyond-works.co.jp’, 20, 1),
  -> (‘田中ゆうこ’,’tanaka@beyond-works.co.jp’,25,2),
  -> (‘福田だいすけ’,’fukuda@beyond-works.co.jp’,42,1),
  -> (‘豊島はなこ’,’toyoshima@beyond-works.co.jp’,34,2),
  -> (‘早坂てつお’,’hayasaka@beyond-works.co.jp’,61,1),
  -> (‘不思議沢みちこ‘,NULL,NULL,NULL);
Query OK, 6 rows affected (0.00 sec)
Records: 6 Duplicates: 0 Warnings: 0

mysql> SELECT * FROM PEOPLE;
+-----------+-----------------------+------------------------------+------+--------+---------------------+---------------------+
| person_id | name         | email            | age | gender | created_at     | updated_at     |
+-----------+-----------------------+------------------------------+------+--------+---------------------+---------------------+
|     1 | 鈴木たかし      | suzuki@beyond-works.co.jp  |  20 |   1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|     2 | 田中ゆうこ      | tanaka@beyond-works.co.jp  |  25 |   2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|     3 | 福田だいすけ     | fukuda@beyond-works.co.jp  |  42 |   1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|     4 | 豊島はなこ      | toyoshima@beyond-works.co.jp |  34 |   2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|     5 | 早坂てつお      | hayasaka@beyond-works.co.jp |  61 |   1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|     6 | 不思議沢みちこ    | NULL             | NULL |  NULL | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
+-----------+-----------------------+------------------------------+------+--------+---------------------+---------------------+
6 rows in set (0.01 sec)

mysql> DELETE FROM people WHERE person_id = 5;
Query OK, 1 row affected (0.00 sec)

mysql> SELECT person_id, name FROM people;
+-----------+-----------------------+
| person_id | name         |
+-----------+-----------------------+
|     1 | 鈴木たかし      |
|     2 | 田中ゆうこ      |
|     3 | 福田だいすけ     |
|     4 | 豊島はなこ      |
|     6 | 不思議沢みちこ    |
+-----------+-----------------------+
5 rows in set (0.00 sec)

mysql> SELECT * FROM people WHERE person_id = 1;
+-----------+-----------------+---------------------------+------+--------+---------------------+---------------------+
| person_id | name      | email           | age | gender | created_at     | updated_at     |
+-----------+-----------------+---------------------------+------+--------+---------------------+---------------------+
|     1 | 鈴木たかし   | suzuki@beyond-works.co.jp |  20 |   1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
+-----------+-----------------+---------------------------+------+--------+---------------------+---------------------+
1 row in set (0.00 sec)

mysql> SELECT * FROM people WHERE name NOT IN (‘鈴木たかし‘, ‘豊島はなこ‘);
+-----------+-----------------------+---------------------------+------+--------+---------------------+---------------------+
| person_id | name         | email           | age | gender | created_at     | updated_at     |
+-----------+-----------------------+---------------------------+------+--------+---------------------+---------------------+
|     2 | 田中ゆうこ      | tanaka@beyond-works.co.jp |  25 |   2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|     3 | 福田だいすけ     | fukuda@beyond-works.co.jp |  42 |   1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|     6 | 不思議沢みちこ    | NULL           | NULL |  NULL | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
+-----------+-----------------------+---------------------------+------+--------+---------------------+---------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM people WHERE name IN (‘鈴木たかし‘, ‘豊島はなこ‘);
+-----------+-----------------+------------------------------+------+--------+---------------------+---------------------+
| person_id | name      | email            | age | gender | created_at     | updated_at     |
+-----------+-----------------+------------------------------+------+--------+---------------------+---------------------+
|     1 | 鈴木たかし   | suzuki@beyond-works.co.jp  |  20 |   1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|     4 | 豊島はなこ   | toyoshima@beyond-works.co.jp |  34 |   2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
+-----------+-----------------+------------------------------+------+--------+---------------------+---------------------+
2 rows in set (0.00 sec)

mysql> SELECT * FROM people LIMIT 3;
+-----------+--------------------+---------------------------+------+--------+---------------------+---------------------+
| person_id | name        | email           | age | gender | created_at     | updated_at     |
+-----------+--------------------+---------------------------+------+--------+---------------------+---------------------+
|     1 | 鈴木たかし     | suzuki@beyond-works.co.jp |  20 |   1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|     2 | 田中ゆうこ     | tanaka@beyond-works.co.jp |  25 |   2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|     3 | 福田だいすけ    | fukuda@beyond-works.co.jp |  42 |   1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
+-----------+--------------------+---------------------------+------+--------+---------------------+---------------------+
3 rows in set (0.00 sec)

mysql> SELECT * FROM people LIMIT 3 OFFSET 3;
+-----------+-----------------------+------------------------------+------+--------+---------------------+---------------------+
| person_id | name         | email            | age | gender | created_at     | updated_at     |
+-----------+-----------------------+------------------------------+------+--------+---------------------+---------------------+
|     4 | 豊島はなこ      | toyoshima@beyond-works.co.jp |  34 |   2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|     6 | 不思議沢みちこ    | NULL             | NULL |  NULL | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
+-----------+-----------------------+------------------------------+------+--------+---------------------+---------------------+
2 rows in set (0.00 sec)

mysql> CREATE TABLE reports (
  -> report_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  -> person_id INT UNSIGNED NOT NULL,
  -> content TEXT NOT NULL,
  -> created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  -> updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP);
Query OK, 0 rows affected (0.01 sec)

mysql> show tables reports;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ‘reports’ at line 1
mysql> show tables;
+---------------------+
| Tables_in_db_lesson |
+---------------------+
| people       |
| reports       |
+---------------------+
2 rows in set (0.00 sec)

mysql> desc reports
  -> ;
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field   | Type     | Null | Key | Default      | Extra                     |
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
| report_id | int unsigned | NO  | PRI | NULL       | auto_increment                |
| person_id | int unsigned | NO  |   | NULL       |                        |
| content  | text     | NO  |   | NULL       |                        |
| created_at | timestamp  | YES |   | CURRENT_TIMESTAMP | DEFAULT_GENERATED               |
| updated_at | timestamp  | YES |   | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
5 rows in set (0.01 sec)

mysql> INSERT INTO reports (person_id, content) VALUES
  -> (2, ‘日報1’),
  -> (3, ‘日報2’),
  -> (4, ‘日報3’),
  -> (6, ‘日報4’),
  -> (2, ‘日報5’),
  -> (3, ‘日報6’),
  -> (4, ‘日報7’),
  -> (6, ‘日報8’),
  -> (2, ‘日報9’),
  -> (3, ‘日報10’),
  -> (10, ‘日報11’);
Query OK, 11 rows affected (0.01 sec)
Records: 11 Duplicates: 0 Warnings: 0

mysql> SELECT * FROM people INNER JOIN reports ON people.person_id = reports.person_id;
+-----------+-----------------------+------------------------------+------+--------+---------------------+---------------------+-----------+-----------+----------+---------------------+---------------------+
| person_id | name         | email            | age | gender | created_at     | updated_at     | report_id | person_id | content | created_at     | updated_at     |
+-----------+-----------------------+------------------------------+------+--------+---------------------+---------------------+-----------+-----------+----------+---------------------+---------------------+
|     2 | 田中ゆうこ      | tanaka@beyond-works.co.jp  |  25 |   2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |     1 |     2 | 日報1  | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|     3 | 福田だいすけ     | fukuda@beyond-works.co.jp  |  42 |   1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |     2 |     3 | 日報2  | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|     4 | 豊島はなこ      | toyoshima@beyond-works.co.jp |  34 |   2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |     3 |     4 | 日報3  | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|     6 | 不思議沢みちこ    | NULL             | NULL |  NULL | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |     4 |     6 | 日報4  | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|     2 | 田中ゆうこ      | tanaka@beyond-works.co.jp  |  25 |   2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |     5 |     2 | 日報5  | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|     3 | 福田だいすけ     | fukuda@beyond-works.co.jp  |  42 |   1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |     6 |     3 | 日報6  | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|     4 | 豊島はなこ      | toyoshima@beyond-works.co.jp |  34 |   2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |     7 |     4 | 日報7  | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|     6 | 不思議沢みちこ    | NULL             | NULL |  NULL | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |     8 |     6 | 日報8  | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|     2 | 田中ゆうこ      | tanaka@beyond-works.co.jp  |  25 |   2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |     9 |     2 | 日報9  | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|     3 | 福田だいすけ     | fukuda@beyond-works.co.jp  |  42 |   1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |    10 |     3 | 日報10  | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
+-----------+-----------------------+------------------------------+------+--------+---------------------+---------------------+-----------+-----------+----------+---------------------+---------------------+
10 rows in set (0.00 sec)

mysql> SELECT people.person_id, people.name, reports.content
  -> FROM people INNER JOIN reports ON people.person_id = reports.person_id;
+-----------+-----------------------+----------+
| person_id | name         | content |
+-----------+-----------------------+----------+
|     2 | 田中ゆうこ      | 日報1  |
|     3 | 福田だいすけ     | 日報2  |
|     4 | 豊島はなこ      | 日報3  |
|     6 | 不思議沢みちこ    | 日報4  |
|     2 | 田中ゆうこ      | 日報5  |
|     3 | 福田だいすけ     | 日報6  |
|     4 | 豊島はなこ      | 日報7  |
|     6 | 不思議沢みちこ    | 日報8  |
|     2 | 田中ゆうこ      | 日報9  |
|     3 | 福田だいすけ     | 日報10  |
+-----------+-----------------------+----------+
10 rows in set (0.01 sec)

mysql> SELECT p.person_id, p.name, r.content FROM people p JOIN reports r USING (person_id);
+-----------+-----------------------+----------+
| person_id | name         | content |
+-----------+-----------------------+----------+
|     2 | 田中ゆうこ      | 日報1  |
|     3 | 福田だいすけ     | 日報2  |
|     4 | 豊島はなこ      | 日報3  |
|     6 | 不思議沢みちこ    | 日報4  |
|     2 | 田中ゆうこ      | 日報5  |
|     3 | 福田だいすけ     | 日報6  |
|     4 | 豊島はなこ      | 日報7  |
|     6 | 不思議沢みちこ    | 日報8  |
|     2 | 田中ゆうこ      | 日報9  |
|     3 | 福田だいすけ     | 日報10  |
+-----------+-----------------------+----------+
10 rows in set (0.01 sec)

mysql> SELECT p.person_id, p.name, r.content FROM people p LEFT OUTER JOIN reports r USING (person_id);
+-----------+-----------------------+----------+
| person_id | name         | content |
+-----------+-----------------------+----------+
|     1 | 鈴木たかし      | NULL   |
|     2 | 田中ゆうこ      | 日報9  |
|     2 | 田中ゆうこ      | 日報5  |
|     2 | 田中ゆうこ      | 日報1  |
|     3 | 福田だいすけ     | 日報10  |
|     3 | 福田だいすけ     | 日報6  |
|     3 | 福田だいすけ     | 日報2  |
|     4 | 豊島はなこ      | 日報7  |
|     4 | 豊島はなこ      | 日報3  |
|     6 | 不思議沢みちこ    | 日報8  |
|     6 | 不思議沢みちこ    | 日報4  |
+-----------+-----------------------+----------+
11 rows in set (0.01 sec)

mysql> SELECT p.person_id, p.name, r.content FROM people p RIGHT OUTER JOIN reports r USING (person_id);
+-----------+-----------------------+----------+
| person_id | name         | content |
+-----------+-----------------------+----------+
|     2 | 田中ゆうこ      | 日報1  |
|     3 | 福田だいすけ     | 日報2  |
|     4 | 豊島はなこ      | 日報3  |
|     6 | 不思議沢みちこ    | 日報4  |
|     2 | 田中ゆうこ      | 日報5  |
|     3 | 福田だいすけ     | 日報6  |
|     4 | 豊島はなこ      | 日報7  |
|     6 | 不思議沢みちこ    | 日報8  |
|     2 | 田中ゆうこ      | 日報9  |
|     3 | 福田だいすけ     | 日報10  |
|   NULL | NULL         | 日報11  |
+-----------+-----------------------+----------+
11 rows in set (0.00 sec)

mysql> SELECT gender FROM people GROUP BY gender;
+--------+
| gender |
+--------+
|   1 |
|   2 |
|  NULL |
+--------+
3 rows in set (0.04 sec)

mysql> SELECT gender FROM people GROUP BY gender;
+--------+
| gender |
+--------+
|   1 |
|   2 |
|  NULL |
+--------+
3 rows in set (0.00 sec)

mysql> SELECT gender, COUNT(*) AS people_count FROM people GROUP BY gender;
+--------+--------------+
| gender | people_count |
+--------+--------------+
|   1 |      2 |
|   2 |      2 |
|  NULL |      1 |
+--------+--------------+
3 rows in set (0.00 sec)

mysql> SELECT gender, MAX(age) AS max_age, MIN(age) AS min_age FROM people GROUP BY gender;
+--------+---------+---------+
| gender | max_age | min_age |
+--------+---------+---------+
|   1 |   42 |   20 |
|   2 |   34 |   25 |
|  NULL |  NULL |  NULL |
+--------+---------+---------+
3 rows in set (0.00 sec)

mysql> SELECT AVG(age) AS average_age FROM people GROUP BY gender;
+-------------+
| average_age |
+-------------+
|   31.0000 |
|   29.5000 |
|    NULL |
+-------------+
3 rows in set (0.00 sec)

mysql> SELECT SUM(age) AS total_age FROM people GROUP BY gender;
+-----------+
| total_age |
+-----------+
|    62 |
|    59 |
|   NULL |
+-----------+
3 rows in set (0.00 sec)

mysql> CREATE TABLE departments (
    ->     department_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    ->     name VARCHAR(20) NOT NULL,
    ->     created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    ->     updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
    -> );
Query OK, 0 rows affected (0.03 sec)

mysql> DESC departments;
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type         | Null | Key | Default           | Extra                                         |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| department_id | int unsigned | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)  | NO   |     | NULL              |                                               |
| created_at    | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
4 rows in set (0.01 sec)

mysql> ALTER TABLE departments
    -> MODIFY created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -> MODIFY updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> DESC departments;
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type         | Null | Key | Default           | Extra                                         |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| department_id | int unsigned | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)  | NO   |     | NULL              |                                               |
| created_at    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
4 rows in set (0.01 sec)

mysql> desc departments;
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type         | Null | Key | Default           | Extra                                         |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| department_id | int unsigned | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)  | NO   |     | NULL              |                                               |
| created_at    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
4 rows in set (0.01 sec)

mysql> ALTER TABLE people
    -> ADD COLUMN department_id INT(10) UNSIGNED AFTER email;
Query OK, 0 rows affected, 1 warning (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 1

mysql> DESC people;
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
8 rows in set (0.01 sec)

mysql> INSERT INTO departments (name) VALUES 
    -> (‘営業‘),
    -> (‘開発‘),
    -> (‘経理‘),
    -> (‘人事‘),
    -> (‘情報システム‘);
Query OK, 5 rows affected (0.00 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> desc departments;
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field         | Type         | Null | Key | Default           | Extra                                         |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
| department_id | int unsigned | NO   | PRI | NULL              | auto_increment                                |
| name          | varchar(20)  | NO   |     | NULL              |                                               |
| created_at    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at    | timestamp    | NO   |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+---------------+--------------+------+-----+-------------------+-----------------------------------------------+
4 rows in set (0.00 sec)

mysql> SELECT * FROM departments;
+---------------+--------------------+---------------------+---------------------+
| department_id | name               | created_at          | updated_at          |
+---------------+--------------------+---------------------+---------------------+
|             1 | 営業               | 2025-09-18 10:55:19 | 2025-09-18 10:55:19 |
|             2 | 開発               | 2025-09-18 10:55:19 | 2025-09-18 10:55:19 |
|             3 | 経理               | 2025-09-18 10:55:19 | 2025-09-18 10:55:19 |
|             4 | 人事               | 2025-09-18 10:55:19 | 2025-09-18 10:55:19 |
|             5 | 情報システム       | 2025-09-18 10:55:19 | 2025-09-18 10:55:19 |
+---------------+--------------------+---------------------+---------------------+
5 rows in set (0.00 sec)

mysql> INSERT INTO people (name, email, department_id) 
    -> VALUES
    -> (‘山田太郎‘, ’
yamada.taro@example.com
‘, 1),
    -> (‘佐藤花子’, ‘sato.hanako@example.com’, 1), 
    -> (‘鈴木次郎’, ‘suzuki.jiro@example.com’, 1),   
    -> (‘高橋美咲’, ‘takahashi.misaki@example.com’, 2), 
    -> (‘田中健’, ‘tanaka.ken@example.com’, 2),
    -> (‘伊藤梨花’, ‘ito.rika@example.com’, 2),  
    -> (‘中村亮’, ‘nakamura.ryo@example.com’, 2),
    -> (‘小林恵子’, ‘kobayashi.keiko@example.com’, 3), 
    -> (‘加藤雄大’, ‘kato.yudai@example.com’, 4), 
    -> (‘松本彩’, ‘matsumoto.aya@example.com’, 5);
Query OK, 10 rows affected (0.01 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> SELECT * FROM people;
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name                  | email                        | department_id | age  | gender | created_at          | updated_at          |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし            | suzuki@beyond-works.co.jp    |          NULL |   20 |      1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|         2 | 田中ゆうこ            | tanaka@beyond-works.co.jp    |          NULL |   25 |      2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|         3 | 福田だいすけ          | fukuda@beyond-works.co.jp    |          NULL |   42 |      1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|         4 | 豊島はなこ            | toyoshima@beyond-works.co.jp |          NULL |   34 |      2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|         6 | 不思議沢みちこ        | NULL                         |          NULL | NULL |   NULL | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|         7 | 山田太郎              | yamada.taro@example.com      |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|         8 | 佐藤花子              | sato.hanako@example.com      |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|         9 | 鈴木次郎              | suzuki.jiro@example.com      |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        10 | 高橋美咲              | takahashi.misaki@example.com |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        11 | 田中健                | tanaka.ken@example.com       |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        12 | 伊藤梨花              | ito.rika@example.com         |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        13 | 中村亮                | nakamura.ryo@example.com     |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        14 | 小林恵子              | kobayashi.keiko@example.com  |             3 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        15 | 加藤雄大              | kato.yudai@example.com       |             4 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        16 | 松本彩                | matsumoto.aya@example.com    |             5 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
15 rows in set (0.00 sec)

mysql> INSERT INTO reports (person_id, content)
    -> VALUES
    -> (1, ‘reports0001’),
    -> (2, ‘reports0002’),
    -> (3, ‘reports0003’),
    -> (4, ‘reports0004’),
    -> (5, ‘reports0005’),
    -> (6, ‘reports0006’),
    -> (7, ‘reports0007’),
    -> (8, ‘reports0008’),
    -> (9, ‘reports0009’),
    -> (10,‘reports0010’);
Query OK, 10 rows affected (0.00 sec)
Records: 10  Duplicates: 0  Warnings: 0

mysql> desc reports;
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
| Field      | Type         | Null | Key | Default           | Extra                                         |
+------------+--------------+------+-----+-------------------+-----------------------------------------------+
| report_id  | int unsigned | NO   | PRI | NULL              | auto_increment                                |
| person_id  | int unsigned | NO   |     | NULL              |                                               |
| content    | text         | NO   |     | NULL              |                                               |
| created_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED                             |
| updated_at | timestamp    | YES  |     | CURRENT_TIMESTAMP | DEFAULT_GENERATED on update CURRENT_TIMESTAMP |
+------------+----------
----+------+-----+-------------------+-----------------------------------------------+
5 rows in set (0.01 sec)

mysql> SELECT * FROM reports;
+-----------+-----------+-------------+---------------------+---------------------+
| report_id | person_id | content     | created_at          | updated_at          |
+-----------+-----------+-------------+---------------------+---------------------+
|         1 |         2 | 日報1       | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|         2 |         3 | 日報2       | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|         3 |         4 | 日報3       | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|         4 |         6 | 日報4       | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|         5 |         2 | 日報5       | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|         6 |         3 | 日報6       | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|         7 |         4 | 日報7       | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|         8 |         6 | 日報8       | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|         9 |         2 | 日報9       | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|        10 |         3 | 日報10      | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|        11 |        10 | 日報11      | 2025-09-17 12:42:48 | 2025-09-17 12:42:48 |
|        12 |         1 | reports0001 | 2025-09-18 11:29:25 | 2025-09-18 11:29:25 |
|        13 |         2 | reports0002 | 2025-09-18 11:29:25 | 2025-09-18 11:29:25 |
|        14 |         3 | reports0003 | 2025-09-18 11:29:25 | 2025-09-18 11:29:25 |
|        15 |         4 | reports0004 | 2025-09-18 11:29:25 | 2025-09-18 11:29:25 |
|        16 |         5 | reports0005 | 2025-09-18 11:29:25 | 2025-09-18 11:29:25 |
|        17 |         6 | reports0006 | 2025-09-18 11:29:25 | 2025-09-18 11:29:25 |
|        18 |         7 | reports0007 | 2025-09-18 11:29:25 | 2025-09-18 11:29:25 |
|        19 |         8 | reports0008 | 2025-09-18 11:29:25 | 2025-09-18 11:29:25 |
|        20 |         9 | reports0009 | 2025-09-18 11:29:25 | 2025-09-18 11:29:25 |
|        21 |        10 | reports0010 | 2025-09-18 11:29:25 | 2025-09-18 11:29:25 |
+-----------+-----------+-------------+---------------------+---------------------+
21 rows in set (0.01 sec)

mysql> mysql> SELECT * FROM people;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near ‘mysql> SELECT * FROM people’ at line 1
mysql> 
mysql> SELECT * FROM people;
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name                  | email                        | department_id | age  | gender | created_at          | updated_at          |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし            | suzuki@beyond-works.co.jp    |          NULL |   20 |      1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|         2 | 田中ゆうこ            | tanaka@beyond-works.co.jp    |          NULL |   25 |      2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|         3 | 福田だいすけ          | fukuda@beyond-works.co.jp    |          NULL |   42 |      1 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|         4 | 豊島はなこ            | toyoshima@beyond-works.co.jp |          NULL |   34 |      2 | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|         6 | 不思議沢みちこ        | NULL                         |          NULL | NULL |   NULL | 2025-09-17 11:52:40 | 2025-09-17 11:52:40 |
|         7 | 山田太郎              | yamada.taro@example.com      |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|         8 | 佐藤花子              | sato.hanako@example.com      |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|         9 | 鈴木次郎              | suzuki.jiro@example.com      |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        10 | 高橋美咲              | takahashi.misaki@example.com |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        11 | 田中健                | tanaka.ken@example.com       |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        12 | 伊藤梨花              | ito.rika@example.com         |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        13 | 中村亮                | nakamura.ryo@example.com     |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        14 | 小林恵子              | kobayashi.keiko@example.com  |             3 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        15 | 加藤雄大              | kato.yudai@example.com       |             4 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        16 | 松本彩                | matsumoto.aya@example.com    |             5 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
15 rows in set (0.00 sec)

mysql> UPDATE people
    -> SET department_id = 1
    -> WHERE person_id = 1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people
    -> SET department_id = 1
    -> WHERE person_id = 2;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people
    -> SET department_id = 1
    -> WHERE person_id = 3;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> UPDATE people
    -> SET department_id = 2
    -> WHERE person_id IN (4, 5, 6);
Query OK, 3 rows affected (0.00 sec)
Rows matched: 3  Changed: 3  Warnings: 0

mysql> SELECT * FROM people;
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name                  | email                        | department_id | age  | gender | created_at          | updated_at          |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
|         1 | 鈴木たかし            | suzuki@beyond-works.co.jp    |             1 |   20 |      1 | 2025-09-17 11:52:40 | 2025-09-18 11:41:19 |
|         2 | 田中ゆうこ            | tanaka@beyond-works.co.jp    |             1 |   25 |      2 | 2025-09-17 11:52:40 | 2025-09-18 11:41:34 |
|         3 | 福田だいすけ          | fukuda@beyond-works.co.jp    |             1 |   42 |      1 | 2025-09-17 11:52:40 | 2025-09-18 11:41:43 |
|         4 | 豊島はなこ            | toyoshima@beyond-works.co.jp |             2 |   34 |      2 | 2025-09-17 11:52:40 | 2025-09-18 11:42:17 |
|         6 | 不思議沢みちこ        | NULL                         |             2 | NULL |   NULL | 2025-09-17 11:52:40 | 2025-09-18 11:42:17 |
|         7 | 山田太郎              | yamada.taro@example.com      |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:47:36 |
|         8 | 佐藤花子              | sato.hanako@example.com      |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|         9 | 鈴木次郎              | suzuki.jiro@example.com      |             1 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        10 | 高橋美咲              | takahashi.misaki@example.com |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        11 | 田中健                | tanaka.ken@example.com       |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        12 | 伊藤梨花              | ito.rika@example.com         |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        13 | 中村亮                | nakamura.ryo@example.com     |             2 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        14 | 小林恵子              | kobayashi.keiko@example.com  |             3 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        15 | 加藤雄大              | kato.yudai@example.com       |             4 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|        16 | 松本彩                | matsumoto.aya@example.com    |             5 | NULL |   NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
+-----------+-----------------------+------------------------------+---------------+------+--------+---------------------+---------------------+
15 rows in set (0.00 sec)

mysql> SELECT name, age
    -> FROM people
    -> WHERE gender = 1
    -> ORDER BY age DESC;
+--------------------+------+
| name               | age  |
+--------------------+------+
| 福田だいすけ       |   42 |
| 鈴木たかし         |   20 |
+--------------------+------+
2 rows in set (0.00 sec)

mysql> -- Q6: peopleテーブルからdepartment_idが1のレコードを取得し、
mysql> -- name, email, ageカラムを抽出。created_atカラムで昇順に並べ替え。
mysql> SELECT
    ->   `name`, `email`, `age`
    -> FROM
    ->   `people`
    -> WHERE
    ->   `department_id` = 1
    -> ORDER BY
    ->   `created_at`;
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
6 rows in set (0.00 sec)

mysql> SELECT name
  -> FROM people
  -> WHERE (age BETWEEN 20 AND 29 AND gender = 2)
  ->  OR (age BETWEEN 40 AND 49 AND gender = 1);
+--------------------+
| name        |
+--------------------+
| 田中ゆうこ     |
| 福田だいすけ    |
+--------------------+
2 rows in set (0.00 sec)

mysql> SELECT *
  -> FROM people
  -> WHERE department_id = 1
  -> ORDER BY age ASC;
+-----------+--------------------+---------------------------+---------------+------+--------+---------------------+---------------------+
| person_id | name        | email           | department_id | age | gender | created_at     | updated_at     |
+-----------+--------------------+---------------------------+---------------+------+--------+---------------------+---------------------+
|     7 | 山田太郎      | yamada.taro@example.com  |       1 | NULL |  NULL | 2025-09-18 11:07:57 | 2025-09-18 11:47:36 |
|     8 | 佐藤花子      | sato.hanako@example.com  |       1 | NULL |  NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|     9 | 鈴木次郎      | suzuki.jiro@example.com  |       1 | NULL |  NULL | 2025-09-18 11:07:57 | 2025-09-18 11:07:57 |
|     1 | 鈴木たかし     | suzuki@beyond-works.co.jp |       1 |  20 |   1 | 2025-09-17 11:52:40 | 2025-09-18 11:41:19 |
|     2 | 田中ゆうこ     | tanaka@beyond-works.co.jp |       1 |  25 |   2 | 2025-09-17 11:52:40 | 2025-09-18 11:41:34 |
|     3 | 福田だいすけ    | fukuda@beyond-works.co.jp |       1 |  42 |   1 | 2025-09-17 11:52:40 | 2025-09-18 11:41:43 |
+-----------+--------------------+---------------------------+---------------+------+--------+---------------------+---------------------+
6 rows in set (0.00 sec)

mysql> SELECT AVG(age) AS average_age
  -> FROM people
  -> WHERE department_id = 2
  ->  AND gender = 2;
+-------------+
| average_age |
+-------------+
|   34.0000 |
+-------------+
1 row in set (0.00 sec)

mysql> SELECT 
  ->   p.name,
  ->   d.name AS department_name,
  ->   r.content AS report_content
  -> FROM people p
  -> INNER JOIN departments d ON p.department_id = d.department_id
  -> INNER JOIN reports r ON p.person_id = r.person_id;
+-----------------------+-----------------+----------------+
| name         | department_name | report_content |
+-----------------------+-----------------+----------------+
| 田中ゆうこ      | 営業      | 日報1     |
| 福田だいすけ     | 営業      | 日報2     |
| 豊島はなこ      | 開発      | 日報3     |
| 不思議沢みちこ    | 開発      | 日報4     |
| 田中ゆうこ      | 営業      | 日報5     |
| 福田だいすけ     | 営業      | 日報6     |
| 豊島はなこ      | 開発      | 日報7     |
| 不思議沢みちこ    | 開発      | 日報8     |
| 田中ゆうこ      | 営業      | 日報9     |
| 福田だいすけ     | 営業      | 日報10     |
| 高橋美咲       | 開発      | 日報11     |
| 鈴木たかし      | 営業      | reports0001  |
| 田中ゆうこ      | 営業      | reports0002  |
| 福田だいすけ     | 営業      | reports0003  |
| 豊島はなこ      | 開発      | reports0004  |
| 不思議沢みちこ    | 開発      | reports0006  |
| 山田太郎       | 営業      | reports0007  |
| 佐藤花子       | 営業      | reports0008  |
| 鈴木次郎       | 営業      | reports0009  |
| 高橋美咲       | 開発      | reports0010  |
+-----------------------+-----------------+----------------+
20 rows in set (0.00 sec)

mysql> SELECT p.name
  -> FROM people p
  -> LEFT JOIN reports r
  ->  ON p.person_id = r.person_id
  -> WHERE r.report_id IS NULL;
+--------------+
| name     |
+--------------+
| 田中健    |
| 伊藤梨花   |
| 中村亮    |
| 小林恵子   |
| 加藤雄大   |
| 松本彩    |
+--------------+
6 rows in set (0.00 sec)
