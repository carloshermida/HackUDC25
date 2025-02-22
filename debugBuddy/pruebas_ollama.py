import requests
import os
from datetime import datetime
import os
from dotenv import load_dotenv
from supabase import create_client, Client
import app

import platform


def obtein_OS():
    os = platform.system()
    if os == 'win32':
        return 'Windows'
    elif os == 'Darwin':
        return 'MacOS'
    else:
        info = platform.freedesktop_os_release()
        return f'{os}, {info["NAME"]}'



#@app.route('/deepseek/<string:skill>')
def skill_descripcion(skill):


    url = 'http://localhost:11434/api/chat'

    data = {
        "model": "deepseek-coder",
        "messages": [
            {
                "role": "user",
                "content": f'Dame una descripcion de unas 150 palabras de {skill}'
            }
        ],
        "stream":False
    }

#Falta introducir un prompt que funcione
#@app.route('/deepseek/<string:skill>')
def skill_previous_knowlech(skill):


    url = 'http://localhost:11434/api/chat'

    data = {
        "model": "deepseek-coder",
        "messages": [
            {
                "role": "user",
                "content": f'Devuelve una lista de lso conocimientos previos (entorno a +-4)para la skill {skill}. Tan solo una lista con la minima informacion posible, solo nombrarlos.'
            }
        ],
        "stream":False
    }

    response = requests.post(url, json=data)
    return response.json()
    #print(response.text)



#@app.route('/deepseek/<string:skill, list:skill_list>')
def intelillent_serch(skill, skill_list):


    url = 'http://localhost:11434/api/chat'

    data = {
        "model": "deepseek-coder",
        "messages": [
            {
                "role": "user",
                "content": f'Devuelve una lista. Quiero saber si {skill} es o se parece a alguna de {skill_list}. Si es una, solo devuelve esa palabra. Si se parece a alguna, devuelve a las que se parecen. Si no se parece a ninguna, devuelve NULL'
            }
        ],
        "stream":False
    }

    response = requests.post(url, json=data)
    return response.json()
    





#@app.route('/deepseek/<string:skill')
def install_tuto(skill):

    os = obtein_OS()
    url = 'http://localhost:11434/api/chat'

    data = {
        "model": "deepseek-coder",
        "messages": [
            {
                "role": "user",
                "content": f'Devuelve un tutorial detallado de la  de como instalar {skill} en mi sistema operativo {os}'
            }
        ],
        "stream":False
    }

    response = requests.post(url, json=data)
    return response.json()

print(install_tuto('Numpy')['message']['content'])





#@app.route('/deepseek/<string:skill')
def basic_info(skill):

    url = 'http://localhost:11434/api/chat'

    data = {
        "model": "deepseek-coder",
        "messages": [
            {
                "role": "user",
                "content": f'Devuelve un tutorial con la informacion basica que deberia de saber para empezar con {skill}. Ya lo tengo instalado, solo quiero aprender a usarlo. saber las nociones basicas de uso. Mi sistema operativo es {obtein_OS} si te sirve de algo.'
            }
        ],
        "stream":False
    }

    response = requests.post(url, json=data)
    return response.json()

print(basic_info('Numpy')['message']['content'])

