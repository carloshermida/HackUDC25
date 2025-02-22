import os
from dotenv import load_dotenv
from supabase import create_client, Client

# Cargar las variables de entorno desde el archivo .env
load_dotenv()

# Obtener las variables de entorno
url: str = os.environ.get("SUPABASE_URL")
key: str = os.environ.get("SUPABASE_KEY")

# Crear el cliente de Supabase
supabase: Client = create_client(url, key)


# Realizar una consulta
response = supabase.rpc("obtener_empleados_con_skill", {"p_skill_id": 8}).execute()
print(response)

response = supabase.rpc("obtener_primer_filtro").execute()
print(response)