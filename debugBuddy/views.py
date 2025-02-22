from flask import Flask
from flask import render_template
from datetime import datetime
from . import app
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

@app.route("/")
def home():
    #response = supabase.rpc("obtener_empleados_con_skill", {"p_skill_id": 8}).execute()
    #response = supabase.rpc("obtener_primer_filtro").execute()
    response = supabase.rpc("eleccion_maestro_skill", {"p_skill_id": 8}).execute()
    return render_template("home.html", data = response)

@app.route("/about/")
def about():
    return render_template("about.html")

@app.route("/contact/")
def contact():
    return render_template("contact.html")
