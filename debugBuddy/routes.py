from flask import Flask, render_template, request
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
    """
    Main menu
    """
    response = dict(supabase.rpc("get_categories").execute())
    categories = []
    for data in response["data"]:
        categories.append((data["id"], data["name"].capitalize()))
    return render_template("index.html", categories = categories)

@app.route("/get_subcategories/<string:category_id>")
def subcategories(category_id: str):   
    response = dict(supabase.rpc("get_subcategories", {"p_category_id": category_id}).execute())
    subcategories = []
    for subcat in response["data"]:
        subcategories.append((subcat["id"],subcat["name"].title()))
    return subcategories


@app.route("/get_issues")
def skills():
    skill_id = request.args.get("p_subcat", default="all")
    p_query = request.args.get("p_query", default='')
    issues = []
    if skill_id != "all":
        response = dict(supabase.rpc("search_skills", {"p_query": p_query, "p_subcat": skill_id}).execute())
    else:
        response = dict(supabase.table("skill").select("id", "name").execute())
    for issue in response["data"]:
        issues.append((issue["id"], issue["name"]))
    return issues

@app.route("/contact/")
def contact():
    return render_template("contact.html")