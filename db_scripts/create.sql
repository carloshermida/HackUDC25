CREATE TABLE category (
    id BIGINT PRIMARY KEY,
    name VARCHAR
);

CREATE TABLE course (
    id BIGINT PRIMARY KEY,
    name VARCHAR,
    organizer VARCHAR,
    url VARCHAR,
    valuable BOOLEAN
);

CREATE TABLE courseSkill (
    course_id BIGINT,
    skill_id BIGINT,
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (skill_id) REFERENCES skill(id),
    PRIMARY KEY (course_id, skill_id)
);

CREATE TABLE employee (
    id BIGINT PRIMARY KEY,
    email VARCHAR,
    job_title VARCHAR,
    name VARCHAR,
    office_id BIGINT,
    phone VARCHAR,
    FOREIGN KEY (office_id) REFERENCES office(id)
);

CREATE TABLE employeeCourse (
    course_id BIGINT,
    employee_id BIGINT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (course_id) REFERENCES course(id),
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    PRIMARY KEY (course_id, employee_id)
);

CREATE TABLE employeeLanguage (
    employee_id BIGINT,
    language_id BIGINT,
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (language_id) REFERENCES language(id),
    PRIMARY KEY (employee_id, language_id)
);

CREATE TABLE employeeProjectSkill (
    employee_id BIGINT,
    project_id BIGINT,
    skill_id BIGINT,
    FOREIGN KEY (employee_id) REFERENCES employee(id),
    FOREIGN KEY (project_id) REFERENCES project(id),
    FOREIGN KEY (skill_id) REFERENCES skill(id),
    PRIMARY KEY (employee_id, project_id, skill_id)
);

CREATE TABLE language (
    id BIGINT PRIMARY KEY,
    name TEXT
);

CREATE TABLE office (
    id BIGINT PRIMARY KEY,
    location VARCHAR,
    name VARCHAR
);

CREATE TABLE project (
    id BIGINT PRIMARY KEY,
    description TEXT,
    end_date DATE,
    name VARCHAR,
    open_source BOOLEAN,
    start_date DATE,
    type VARCHAR,
    url TEXT
);

CREATE TABLE skill (
    id BIGINT PRIMARY KEY,
    description TEXT,
    documentation TEXT,
    name VARCHAR
);

CREATE TABLE skillSubcategory (
    skill_id BIGINT,
    subcategory_id BIGINT,
    FOREIGN KEY (skill_id) REFERENCES skill(id),
    FOREIGN KEY (subcategory_id) REFERENCES subCategory(id),
    PRIMARY KEY (skill_id, subcategory_id)
);

CREATE TABLE subCategory (
    id BIGINT PRIMARY KEY,
    category_id BIGINT,
    name VARCHAR,
    FOREIGN KEY (category_id) REFERENCES category(id)
);