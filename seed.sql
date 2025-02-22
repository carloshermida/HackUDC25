-- Categorías
INSERT INTO category (id, name) VALUES 
    (1, 'tecnologías'),
    (2, 'sectores');

-- Subcategorías
INSERT INTO subCategory (id, category_id, name) VALUES
    (1, 1, 'análisis multimedia'),
    (2, 1, 'cloud'),
    (3, 1, 'edge computing y embedded iot'),
    (4, 1, 'inteligencia artificial aplicada'),
    (5, 1, 'seguridad y privacidad'),
    (6, 1, 'sistemas de comunicaciones'),
    (7, 1, 'sistemas de detección, posicionamiento y navegación'),
    (8, 1, 'tecnologías cuánticas'),
    (9, 1, 'tecnologías del lenguaje'),
    (10, 2, 'industria 4.0'),
    (11, 2, 'defensa y seguridad'),
    (12, 2, 'recursos naturales y sector primario'),
    (13, 2, 'aeroespacial'),
    (14, 2, 'marketing, retail y audiovisual'),
    (15, 2, 'banca, sociedad digital y educación'),
    (16, 2, 'salud y bienestar'),
    (17, 2, 'telecomunicaciones');

-- Idiomas
INSERT INTO language (id, name) VALUES
    (1, 'Español'),
    (2, 'Inglés'),
    (3, 'Francés');

-- Oficinas
INSERT INTO office (id, location, name) VALUES
    (1, '40.4168,-3.7038', 'Madrid'),
    (2, '41.3851,2.1734', 'Barcelona'),
    (3, '39.4699,-0.3763', 'Valencia'),
    (4, '37.3891,-5.9845', 'Sevilla');

-- Skills (más de 30)
INSERT INTO skill (id, name, description, documentation) VALUES
    (1, 'Python', 'Lenguaje de programación versátil', 'https://www.python.org, https://docs.python.org'),
    (2, 'R', 'Lenguaje estadístico para análisis de datos', 'https://www.r-project.org, https://cran.r-project.org'),
    (3, 'Pandas', 'Librería de Python para manipulación de datos', 'https://pandas.pydata.org, https://pandas.pydata.org/docs'),
    (4, 'Matplotlib', 'Librería de Python para visualización de datos', 'https://matplotlib.org, https://matplotlib.org/stable/contents.html'),
    (5, 'TensorFlow', 'Framework para machine learning', 'https://www.tensorflow.org, https://www.tensorflow.org/api_docs'),
    (6, 'PyTorch', 'Framework para deep learning', 'https://pytorch.org, https://pytorch.org/docs/stable/index.html'),
    (7, 'Java', 'Lenguaje de programación orientado a objetos', 'https://docs.oracle.com/javase, https://www.java.com/en/'),
    (8, 'JavaScript', 'Lenguaje de programación para la web', 'https://developer.mozilla.org/en-US/docs/Web/JavaScript'),
    (9, 'React', 'Librería para construir interfaces de usuario', 'https://reactjs.org, https://reactjs.org/docs/getting-started.html'),
    (10, 'Node.js', 'Entorno de ejecución para JavaScript en el servidor', 'https://nodejs.org, https://nodejs.org/en/docs/'),
    (11, 'Docker', 'Plataforma de contenedores', 'https://docs.docker.com, https://www.docker.com'),
    (12, 'Kubernetes', 'Sistema de orquestación de contenedores', 'https://kubernetes.io, https://kubernetes.io/docs/'),
    (13, 'MySQL', 'Sistema de gestión de bases de datos relacional', 'https://dev.mysql.com/doc, https://www.mysql.com'),
    (14, 'PostgreSQL', 'Sistema de gestión de bases de datos objeto-relacional', 'https://www.postgresql.org, https://www.postgresql.org/docs/'),
    (15, 'Denodo', 'Plataforma de virtualización de datos', 'https://www.denodo.com, https://community.denodo.com'),
    (16, 'Git', 'Sistema de control de versiones distribuido', 'https://git-scm.com, https://git-scm.com/docs'),
    (17, 'Linux', 'Sistema operativo de código abierto', 'https://www.kernel.org, https://www.linux.org'),
    (18, 'Bash', 'Intérprete de comandos para sistemas Unix', 'https://www.gnu.org/software/bash, https://www.gnu.org/software/bash/manual'),
    (19, 'C++', 'Lenguaje de programación de alto rendimiento', 'https://isocpp.org, https://en.cppreference.com'),
    (20, 'C#', 'Lenguaje de programación desarrollado por Microsoft', 'https://docs.microsoft.com/en-us/dotnet/csharp, https://learn.microsoft.com/en-us/dotnet/csharp'),
    (21, 'Go', 'Lenguaje de programación eficiente y concurrente', 'https://golang.org, https://golang.org/doc'),
    (22, 'Swift', 'Lenguaje de programación para iOS y macOS', 'https://developer.apple.com/swift, https://swift.org/documentation/'),
    (23, 'Ruby', 'Lenguaje de programación dinámico y orientado a objetos', 'https://www.ruby-lang.org, https://www.ruby-lang.org/en/documentation/'),
    (24, 'PHP', 'Lenguaje de programación para desarrollo web', 'https://www.php.net, https://www.php.net/docs.php'),
    (25, 'Laravel', 'Framework de PHP para desarrollo web', 'https://laravel.com, https://laravel.com/docs'),
    (26, 'Django', 'Framework de Python para desarrollo web', 'https://www.djangoproject.com, https://docs.djangoproject.com'),
    (27, 'Flask', 'Microframework de Python para aplicaciones web', 'https://flask.palletsprojects.com, https://flask.palletsprojects.com/en/latest/'),
    (28, 'Angular', 'Framework de JavaScript para aplicaciones web', 'https://angular.io, https://angular.io/docs'),
    (29, 'Vue', 'Framework progresivo de JavaScript para interfaces de usuario', 'https://vuejs.org, https://vuejs.org/v2/guide/'),
    (30, 'Spring Boot', 'Framework para desarrollo de aplicaciones Java', 'https://spring.io/projects/spring-boot, https://docs.spring.io/spring-boot/docs/current/reference/html/'),
    (31, '.NET Core', 'Framework de código abierto para desarrollo en C#', 'https://dotnet.microsoft.com, https://docs.microsoft.com/en-us/dotnet/core'),
    (32, 'Scala', 'Lenguaje de programación funcional y orientado a objetos', 'https://www.scala-lang.org, https://docs.scala-lang.org'),
    (33, 'Hadoop', 'Framework para procesamiento de grandes volúmenes de datos', 'https://hadoop.apache.org, https://hadoop.apache.org/docs'),
    (34, 'Spark', 'Motor de procesamiento para big data', 'https://spark.apache.org, https://spark.apache.org/docs/latest/'),
    (35, 'Redis', 'Sistema de almacenamiento en memoria', 'https://redis.io, https://redis.io/documentation'),
    (36, 'Elasticsearch', 'Motor de búsqueda y análisis de datos', 'https://www.elastic.co, https://www.elastic.co/guide/en/elasticsearch/reference/current/index.html'),
    (37, 'TypeScript', 'Superset tipado de JavaScript', 'https://www.typescriptlang.org, https://www.typescriptlang.org/docs'),
    (38, 'Solidity', 'Lenguaje para contratos inteligentes en blockchain', 'https://docs.soliditylang.org, https://soliditylang.org'),
    (39, 'Flutter', 'Framework para desarrollo de aplicaciones móviles', 'https://flutter.dev, https://flutter.dev/docs'),
    (40, 'C', 'Lenguaje de programación de bajo nivel', 'https://en.cppreference.com/w/c, https://www.iso-9899.info');

-- Relación entre Skills y Subcategorías
INSERT INTO skillSubcategory (skill_id, subcategory_id) VALUES
    (1, 4),   -- Python en inteligencia artificial aplicada
    (2, 4),   -- R en inteligencia artificial aplicada
    (3, 4),   -- Pandas en inteligencia artificial aplicada
    (4, 4),   -- Matplotlib en inteligencia artificial aplicada
    (5, 4),   -- TensorFlow en inteligencia artificial aplicada
    (6, 4),   -- PyTorch en inteligencia artificial aplicada
    (7, 2),   -- Java en cloud
    (8, 1),   -- JavaScript en análisis multimedia
    (9, 1),   -- React en análisis multimedia
    (10, 2),  -- Node.js en cloud
    (11, 2),  -- Docker en cloud
    (12, 2),  -- Kubernetes en cloud
    (13, 2),  -- MySQL en cloud
    (14, 2),  -- PostgreSQL en cloud
    (15, 2),  -- Denodo en cloud
    (16, 2),  -- Git en cloud
    (17, 3),  -- Linux en edge computing y embedded iot
    (18, 3),  -- Bash en edge computing y embedded iot
    (19, 6),  -- C++ en sistemas de comunicaciones
    (20, 6),  -- C# en sistemas de comunicaciones
    (21, 2),  -- Go en cloud
    (22, 3),  -- Swift en edge computing y embedded iot
    (23, 6),  -- Ruby en sistemas de comunicaciones
    (24, 6),  -- PHP en sistemas de comunicaciones
    (25, 6),  -- Laravel en sistemas de comunicaciones
    (26, 4),  -- Django en inteligencia artificial aplicada
    (27, 4),  -- Flask en inteligencia artificial aplicada
    (28, 1),  -- Angular en análisis multimedia
    (29, 1),  -- Vue en análisis multimedia
    (30, 2),  -- Spring Boot en cloud
    (31, 6),  -- .NET Core en sistemas de comunicaciones
    (32, 2),  -- Scala en cloud
    (33, 4),  -- Hadoop en inteligencia artificial aplicada
    (34, 4),  -- Spark en inteligencia artificial aplicada
    (35, 2),  -- Redis en cloud
    (36, 2),  -- Elasticsearch en cloud
    (37, 1),  -- TypeScript en análisis multimedia
    (38, 5),  -- Solidity en seguridad y privacidad
    (39, 3),  -- Flutter en edge computing y embedded iot
    (40, 6);  -- C en sistemas de comunicaciones

-- Cursos
INSERT INTO course (id, name, organizer, url, valuable) VALUES
    (1, 'Data Science Bootcamp', 'Google', 'http://example.com/ds', true),
    (2, 'Machine Learning Advanced', 'Microsoft', 'http://example.com/ml', true),
    (3, 'Web Development with JavaScript', 'LocalCorp', 'http://example.com/webdev', false),
    (4, 'Cloud Computing Essentials', 'IBM', 'http://example.com/cloud', true),
    (5, 'Database Integration Workshop', 'Comercial SA', 'http://example.com/db', false),
    (6, 'Mobile App Development', 'Apple', 'http://example.com/mobile', true);

-- Relación Curso-Skill
INSERT INTO courseSkill (course_id, skill_id) VALUES
    (1, 1),  -- Python
    (1, 2),  -- R
    (1, 3),  -- Pandas
    (1, 4),  -- Matplotlib
    (1, 5),  -- TensorFlow
    (2, 1),  -- Python
    (2, 5),  -- TensorFlow
    (2, 6),  -- PyTorch
    (3, 8),  -- JavaScript
    (3, 9),  -- React
    (3, 10), -- Node.js
    (3, 28), -- Angular
    (4, 7),  -- Java
    (4, 11), -- Docker
    (4, 12), -- Kubernetes
    (4, 16), -- Git
    (4, 30), -- Spring Boot
    (5, 13), -- MySQL
    (5, 14), -- PostgreSQL
    (5, 15), -- Denodo
    (6, 22), -- Swift
    (6, 39), -- Flutter
    (6, 20); -- C#

-- Empleados (nombres españoles)
INSERT INTO employee (id, email, job_title, name, office_id, phone) VALUES
    (1, 'carlos.garcia@example.com', 'Ingeniero de Software', 'Carlos García', 1, '600111222'),
    (2, 'maria.lopez@example.com', 'Analista de Datos', 'María López', 2, '600333444'),
    (3, 'javier.martinez@example.com', 'Desarrollador Web', 'Javier Martínez', 3, '600555666'),
    (4, 'lucia.fernandez@example.com', 'Ingeniera de Sistemas', 'Lucía Fernández', 4, '600777888');

-- Relación Empleado-Curso
INSERT INTO employeeCourse (course_id, employee_id, start_date, end_date) VALUES
    (1, 1, '2023-01-10', '2023-02-10'),
    (4, 1, '2023-03-15', '2023-04-15'),
    (1, 2, '2023-01-15', '2023-02-15'),
    (2, 2, '2023-03-01', '2023-04-01'),
    (3, 3, '2023-02-05', '2023-03-05'),
    (5, 3, '2023-04-10', '2023-05-10'),
    (2, 4, '2023-03-10', '2023-04-10'),
    (4, 4, '2023-05-01', '2023-06-01'),
    (6, 4, '2023-07-01', '2023-08-01');

-- Relación Empleado-Idioma
INSERT INTO employeeLanguage (employee_id, language_id) VALUES
    (1, 1),
    (1, 2),
    (2, 1),
    (3, 1),
    (3, 2),
    (3, 3),
    (4, 1),
    (4, 2);

-- Proyectos
INSERT INTO project (id, description, end_date, name, open_source, start_date, type, url) VALUES
    (1, 'Proyecto para integrar diversas bases de datos', '2022-12-01', 'Integración de Bases de Datos', false, '2022-06-01', 'work', 'http://empresa.com/proyecto1'),
    (2, 'Desarrollo de un sistema de ML para análisis predictivo', '2023-06-01', 'Sistema de Machine Learning', true, '2023-01-01', 'work', 'https://github.com/empresa/proyecto2'),
    (3, 'Aplicación móvil desarrollada como proyecto personal', '2023-03-01', 'App Móvil Personal', true, '2022-09-01', 'personal', 'https://github.com/usuario/appmovil'),
    (4, 'Plataforma para integrar servicios web', '2023-08-01', 'Plataforma Web Integrada', false, '2023-02-01', 'work', 'http://empresa.com/proyecto4'),
    (5, 'Proyecto para desarrollo de soluciones IoT', '2023-10-01', 'Sistema IoT', true, '2023-04-01', 'work', 'https://github.com/empresa/proyecto5');

-- Relación Empleado-Proyecto-Skill
INSERT INTO employeeProjectSkill (employee_id, project_id, skill_id) VALUES
    (1, 1, 13),  -- Carlos: MySQL en Integración de Bases de Datos
    (1, 1, 14),  -- Carlos: PostgreSQL en Integración de Bases de Datos
    (3, 1, 15),  -- Javier: Denodo en Integración de Bases de Datos
    (2, 2, 1),   -- María: Python en Sistema de Machine Learning
    (2, 2, 5),   -- María: TensorFlow en Sistema de Machine Learning
    (4, 2, 6),   -- Lucía: PyTorch en Sistema de Machine Learning
    (4, 2, 34),  -- Lucía: Spark en Sistema de Machine Learning
    (3, 3, 22),  -- Javier: Swift en App Móvil Personal
    (3, 3, 39),  -- Javier: Flutter en App Móvil Personal
    (4, 3, 9),   -- Lucía: React en App Móvil Personal
    (1, 4, 7),   -- Carlos: Java en Plataforma Web Integrada
    (3, 4, 10),  -- Javier: Node.js en Plataforma Web Integrada
    (4, 4, 28),  -- Lucía: Angular en Plataforma Web Integrada
    (1, 5, 17),  -- Carlos: Linux en Sistema IoT
    (2, 5, 11),  -- María: Docker en Sistema IoT
    (4, 5, 12);  -- Lucía: Kubernetes en Sistema IoT
