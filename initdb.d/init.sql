-- create table profile if not exist
CREATE TABLE IF NOT EXISTS profile (
	id SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT,
	employee_id TEXT NOT NULL
);

-- insert data into profile table
INSERT INTO
	profile (name, email, employee_id)
VALUES
	('Hoonhuay Code', 'hoonhuay.c@demo.com', '667701'),
	('AnuchitO Nong', 'anu.n@demo.com', '667702'),
	('Kachang Mun', null, '667703'),
	('Somhoom Kwan Dong', 'som.kd@demo.com', '667704');