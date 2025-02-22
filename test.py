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
response = (
    supabase.table("us")
    .select("*")
    .execute()
)

# Imprimir la respuesta
print(response)