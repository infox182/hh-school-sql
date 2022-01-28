INSERT INTO specialization (name)
SELECT 'Специализация '|| md5(random()::TEXT)
FROM generate_series(1,50);

INSERT INTO area (name)
SELECT 'Регион  '|| md5(random()::TEXT)
FROM generate_series(1,85);

INSERT INTO experience (name)
VALUES
    ('Не имеет значения'),
	('От 1 года до 3 лет'),
	('От 3 до 6 лет'),
	('Нет опыта'),
	('Более 6 лет');

INSERT INTO schedule (name)
VALUES
    ('Полный день'),
	('Удаленная работа'),
	('Гибкий график'),
	('Сменный график');

INSERT INTO cv (title, about, salary, name, surname, public_date,
                years_experience, specialization_id, schedule_id, area_id)
SELECT
       md5(random()::TEXT),
       md5(random()::TEXT),
       random()*200000::INTEGER,
       md5(random()::TEXT),
       md5(random()::TEXT),
       '2021-01-01'::TIMESTAMP + INTERVAL '1 day' * round(random()*365),
       random()*50::INTEGER,
       ((SELECT COUNT(id) - 1 FROM specialization)*random() + 1)::INTEGER,
       ((SELECT COUNT(id) - 1 FROM schedule)*random()) + 1::INTEGER,
       ((SELECT COUNT(id) - 1 FROM area)*random() + 1)::INTEGER
FROM generate_series(1, 100000);

INSERT INTO vacancy (title, description, compensation_from, compensation_to,
                     public_date, specialization_id, experience_id, schedule_id, area_id)
SELECT
       md5(random()::TEXT),
       md5(random()::TEXT),
       random()*100000::INTEGER,
       random()*200000::INTEGER,
       '2021-01-01'::TIMESTAMP + INTERVAL '1 day' * round(random()*365),
       ((SELECT COUNT(id) - 1 FROM specialization)*random() + 1)::INTEGER,
       ((SELECT COUNT(id) - 1 FROM experience)*random() + 1)::INTEGER,
       ((SELECT COUNT(id) - 1 FROM schedule)*random() + 1)::INTEGER,
       ((SELECT COUNT(id) - 1 FROM area)*random() + 1)::INTEGER
FROM generate_series(1,10000);

INSERT INTO reply (text, public_date, vacancy_id, cv_id)
SELECT
       md5(random()::TEXT),
       '2021-01-01'::TIMESTAMP,
       ((SELECT COUNT(id) - 1 FROM vacancy)*random())::INTEGER + 1,
       ((SELECT COUNT(id) - 1 FROM cv)*random()) ::INTEGER + 1
FROM generate_series(1,777777);

UPDATE reply
SET public_date = (SELECT public_date FROM vacancy
                   WHERE reply.vacancy_id = vacancy.id) +
                   INTERVAL '1 day' * round(random()*30);

