from flask import Flask, render_template, request
import os
from dotenv import load_dotenv
import platform
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

@app.route("/templates/index.html")
@app.route("/index.html")
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
        response = dict(supabase.table("skill").select("id", "name", "description").execute())
    for issue in response["data"]:
        issues.append((issue["id"], issue["name"], issue["description"]))
    return issues

@app.route("/skill/<int:skill_id>")
def skill_description(skill_id:str):
    info_skill = dict(supabase.rpc("get_skill", {"p_skill_id": skill_id}).execute())["data"][0]
    qualified_people = dict(supabase.rpc("get_skill_employees", {"p_skill_id": skill_id}).execute())
    emp_info = []
    for emp in qualified_people["data"]:
        emp_info.append((emp["id_employee"], emp["name_employee"]))
    return render_template("skill.html", info_skill = info_skill, emp_info = emp_info)
