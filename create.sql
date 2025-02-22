-- Crear la tabla category
CREATE TABLE category (
    id BIGINT PRIMARY KEY,
    name VARCHAR
);

-- Crear la tabla subCategory
CREATE TABLE subCategory (
    id BIGINT PRIMARY KEY,
    name VARCHAR,
    category_id BIGINT REFERENCES category(id)
);

-- Crear la tabla skill
CREATE TABLE skill (
    id BIGINT PRIMARY KEY,
    name VARCHAR
);

-- Crear la tabla language
CREATE TABLE language (
    id BIGINT PRIMARY KEY,
    name TEXT
);

-- Crear la tabla office
CREATE TABLE office (
    id BIGINT PRIMARY KEY,
    name VARCHAR,
    location VARCHAR
);

-- Crear la tabla employee
CREATE TABLE employee (
    id BIGINT PRIMARY KEY,
    name VARCHAR,
    email VARCHAR,
    phone VARCHAR,
    job_title VARCHAR,
    office_id BIGINT REFERENCES office(id)
);

-- Crear la tabla course
CREATE TABLE course (
    id BIGINT PRIMARY KEY,
    name VARCHAR,
    organizer VARCHAR,
    url VARCHAR,
    valuable BOOLEAN
);

-- Crear la tabla project
CREATE TABLE project (
    id BIGINT PRIMARY KEY,
    name VARCHAR,
    description TEXT,
    url TEXT,
    type VARCHAR,
    open_source BOOLEAN,
    start_date DATE,
    end_date DATE
);

-- Crear la tabla issue
CREATE TABLE issue (
    id BIGINT PRIMARY KEY,
    name VARCHAR,
    description TEXT,
    documentation TEXT,
    subcategory_id BIGINT REFERENCES subCategory(id)
);

-- Tablas intermedias para relaciones muchos a muchos
CREATE TABLE courseSkill (
    course_id BIGINT REFERENCES course(id),
    skill_id BIGINT REFERENCES skill(id),
    PRIMARY KEY (course_id, skill_id)
);

CREATE TABLE employeeCourse (
    employee_id BIGINT REFERENCES employee(id),
    course_id BIGINT REFERENCES course(id),
    start_date DATE,
    end_date DATE,
    PRIMARY KEY (employee_id, course_id)
);

CREATE TABLE employeeLanguage (
    employee_id BIGINT REFERENCES employee(id),
    language_id BIGINT REFERENCES language(id),
    PRIMARY KEY (employee_id, language_id)
);

CREATE TABLE employeeProjectSkill (
    employee_id BIGINT REFERENCES employee(id),
    project_id BIGINT REFERENCES project(id),
    skill_id BIGINT REFERENCES skill(id),
    PRIMARY KEY (employee_id, project_id, skill_id)
);

CREATE TABLE issueSkill (
    issue_id BIGINT REFERENCES issue(id),
    skill_id BIGINT REFERENCES skill(id),
    PRIMARY KEY (issue_id, skill_id)
);