-- Permitir acceso de lectura a todas las tablas desde la api
DO $$
DECLARE
  rec record;
BEGIN
  FOR rec IN
    SELECT table_name
    FROM information_schema.tables
    WHERE table_schema = 'public' AND table_type = 'BASE TABLE'
  LOOP
    EXECUTE format('CREATE POLICY "permitir_lectura" ON public.%I FOR SELECT USING (true)', rec.table_name);
  END LOOP;
END $$;

-- Obtener esquema
WITH columns_info AS (
    SELECT 
        table_name, 
        column_name, 
        data_type 
    FROM information_schema.columns 
    WHERE table_schema = 'public'
), foreign_keys_info AS (
    SELECT 
        tc.table_name AS tabla_origen,
        kcu.column_name AS columna_origen,
        ccu.table_name AS tabla_referenciada,
        ccu.column_name AS columna_referenciada
    FROM information_schema.table_constraints AS tc 
    JOIN information_schema.key_column_usage AS kcu 
        ON tc.constraint_name = kcu.constraint_name
    JOIN information_schema.constraint_column_usage AS ccu 
        ON ccu.constraint_name = tc.constraint_name
    WHERE tc.constraint_type = 'FOREIGN KEY' 
        AND tc.table_schema = 'public'
)
SELECT 
    c.table_name, 
    c.column_name, 
    c.data_type,
    f.tabla_referenciada,
    f.columna_referenciada
FROM columns_info c
LEFT JOIN foreign_keys_info f 
    ON c.table_name = f.tabla_origen 
    AND c.column_name = f.columna_origen
ORDER BY c.table_name, c.column_name;