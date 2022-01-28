CREATE TABLE specialization
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE experience
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE schedule
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE area
(
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE TABLE cv
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    about TEXT,
    salary INTEGER,
    name TEXT NOT NULL ,
    surname TEXT NOT NULL,
    public_date TIMESTAMP NOT NULL,
    years_experience INTEGER,
    specialization_id INTEGER NOT NULL,
    schedule_id INTEGER NOT NULL,
    area_id INTEGER NOT NULL,
    FOREIGN KEY (specialization_id) REFERENCES specialization (id),
    FOREIGN KEY (schedule_id) REFERENCES schedule (id),
    FOREIGN KEY (area_id) REFERENCES area (id)
);


CREATE TABLE vacancy
(
    id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    description TEXT,
    compensation_from INTEGER,
    compensation_to INTEGER,
    public_date TIMESTAMP NOT NULL,
    specialization_id INTEGER NOT NULL,
    experience_id INTEGER NOT NULL,
    schedule_id INTEGER NOT NULL,
    area_id INTEGER NOT NULL,
    FOREIGN KEY (specialization_id) REFERENCES specialization (id),
    FOREIGN KEY (schedule_id) REFERENCES schedule (id),
    FOREIGN KEY (experience_id) REFERENCES experience (id),
    FOREIGN KEY (area_id) REFERENCES area (id)
);

CREATE TABLE reply (
    id SERIAL PRIMARY KEY,
    text TEXT,
    public_date TIMESTAMP NOT NULL,
    cv_id INTEGER NOT NULL,
    vacancy_id INTEGER NOT NULL,
    FOREIGN KEY (cv_id) REFERENCES cv (id),
    FOREIGN KEY (vacancy_id) REFERENCES vacancy (id)
);
