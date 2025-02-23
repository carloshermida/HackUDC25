-- Todas las skills filtrables
CREATE OR REPLACE FUNCTION search_skills(
    p_query text,
    p_cat bigint DEFAULT NULL,
    p_subcat bigint DEFAULT NULL
)
RETURNS TABLE(
  id bigint,
  name varchar,
  description text,
  documentation text
) AS $$
BEGIN
  RETURN QUERY
    SELECT s.id, s.name, s.description, s.documentation
    FROM skill s
    LEFT JOIN "skillSubcategory" ss ON s.id = ss.skill_id
    LEFT JOIN "subCategory" sc ON ss.subcategory_id = sc.id
    LEFT JOIN category c ON sc.category_id = c.id
    WHERE s.name ILIKE '%' || p_query || '%'
      AND (
            p_cat IS NULL
            OR c.id = p_cat
          )
      AND (
            p_subcat IS NULL
            OR sc.id = p_subcat
          )
    ORDER BY s.name;
END;
$$ LANGUAGE plpgsql;


-- Detalles de una skill
CREATE OR REPLACE FUNCTION get_skill(p_skill_id bigint)
RETURNS TABLE(id bigint, name varchar, description text, documentation text) AS $$
BEGIN
  RETURN QUERY
    SELECT s.id, s.name, s.description, s.documentation
    FROM skill s
    WHERE s.id = p_skill_id;
END;
$$ LANGUAGE plpgsql;

-- Obtiene los ids y el tipo de aprendizaje de los empleados que conocen la skill p_skill_id.
CREATE OR REPLACE FUNCTION get_skill_employees(p_skill_id bigint)
RETURNS TABLE(id_employee bigint, name_employee varchar) AS $$
BEGIN
  RETURN QUERY
    SELECT emp.id AS id_employee, emp.name AS name_employee
    FROM employee emp
    JOIN "employeeProjectSkill" eps ON emp.id = eps.employee_id
    WHERE eps.skill_id = p_skill_id
    UNION
    SELECT emp.id AS id_employee, emp.name AS name_employee
    FROM employee emp
    JOIN "employeeCourse" ec ON emp.id = ec.employee_id
    JOIN "courseSkill" cs ON ec.course_id = cs.course_id
    WHERE cs.skill_id = p_skill_id;
END;
$$ LANGUAGE plpgsql;

-- Detalles de un empleado
CREATE OR REPLACE FUNCTION get_employee(p_employee_id bigint)
RETURNS TABLE(
  id bigint,
  email varchar,
  job_title varchar,
  name varchar,
  office_id bigint,
  phone varchar,
  location varchar
) AS $$
BEGIN
  RETURN QUERY
    SELECT e.id, e.email, e.job_title, e.name, e.office_id, e.phone, o.location
    FROM employee e JOIN office o ON e.office_id = o.id
    WHERE e.id = p_employee_id;
END;
$$ LANGUAGE plpgsql;

-- Obtener categorias
CREATE OR REPLACE FUNCTION get_categories()
RETURNS TABLE(name varchar, id bigint) AS $$
BEGIN
  RETURN QUERY
  select c.name, c.id
  from category c;
END;
$$ LANGUAGE plpgsql;


-- Obtener subcategorias
CREATE OR REPLACE FUNCTION get_subcategories(p_category_id bigint)
RETURNS TABLE(id bigint, name varchar) AS $$
BEGIN
  RETURN QUERY
  select s.id, s.name
    from "subCategory" s JOIN category c
    on s.category_id = c.id
    where c.id = p_category_id;
END;
$$ LANGUAGE plpgsql;


CREATE OR REPLACE FUNCTION create_skill(
  p_name varchar,
  p_description text,
  p_documentation text
)
RETURNS void AS $$
DECLARE
  new_id bigint;
BEGIN
  -- Se obtiene el máximo id actual y se suma 1; si no hay registros, se usa 1
  SELECT COALESCE(MAX(id), 0) + 1 INTO new_id FROM skill;
  
  INSERT INTO skill (id, name, description, documentation)
  VALUES (new_id, p_name, p_description, p_documentation);
END;
$$ LANGUAGE plpgsql;

