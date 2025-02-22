import json
from flask import Flask
from flask import render_template
from datetime import datetime
import os
from dotenv import load_dotenv
from supabase import create_client, Client


# Build app object
app = Flask(__name__)

# Cargar las variables de entorno desde el archivo .env
load_dotenv()

# Obtener las variables de entorno
url: str = os.environ.get("SUPABASE_URL")
key: str = os.environ.get("SUPABASE_KEY")

# Crear el cliente de Supabase
supabase: Client = create_client(url, key)

@app.route("/")
def home():
    response = dict(supabase.rpc("get_categories").execute())
    categories = []
    for data in response["data"]:
        categories.append((data["id"], data["name"].capitalize()))
    return render_template("index.html", categories = categories)

@app.route("/get_subcategories/<string:category_id>")
def subcategories(category_id:str):   
    response = dict(supabase.rpc("get_subcategories", {"p_category_id": category_id}).execute())
    subcategories = []
    for subcat in response["data"]:
        subcategories.append((subcat["id"],subcat["name"]))
    return subcategories

@app.route("/contact/")
def contact():
    return render_template("contact.html")