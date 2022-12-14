from flask import render_template, redirect, session, request, flash
from flask_app import app

#Importación del modelo
from flask_app.models.users import User
from flask_app.models.recipes import Recipe

@app.route('/new/recipe')
def new_recipe():
    if 'user_id' not in session: #Comprobamos que el usuario haya iniciado sesiónh
        return redirect('/')

    formulario = {
        'id': session['user_id']
    }

    user = User.get_by_id(formulario) #Instancia del usuario que inicio sesión

    return render_template('new_recipe.html', user=user)


@app.route('/create/recipe', methods=['POST'])
def create_recipe():
    if 'user_id' not in session: #Comprobamos que el usuario haya iniciado sesiónh
        return redirect('/')

    if not Recipe.valida_receta(request.form): #llama a la función de valida_receta enviándole el formulario, comprueba que sea valido 
        return redirect('/new/recipe')

    Recipe.save(request.form)

    return redirect('/dashboard')


@app.route('/edit/recipe/<int:id>') #a través de la URL recibimos el ID de la receta
def edit_recipe(id):
    if 'user_id' not in session: #Comprobamos que el usuario haya iniciado sesiónh
        return redirect('/')

    formulario = {
        'id': session['user_id']
    }

    user = User.get_by_id(formulario) #Instancia del usuario que inicio sesión

    #La instancia de la receta que queremos editar
    formulario_receta = {"id": id}
    recipe = Recipe.get_by_id(formulario_receta)

    return render_template('edit_recipe.html', user=user, recipe=recipe)

@app.route('/update/recipe', methods=['POST'])
def update_recipe():
    if 'user_id' not in session: #Comprobamos que el usuario haya iniciado sesiónh
        return redirect('/')
    
    if not Recipe.valida_receta(request.form): #llama a la función de valida_receta enviándole el formulario, comprueba que sea valido 
        return redirect('/edit/recipe/'+request.form['id'])
    
    Recipe.update(request.form)
    return redirect('/dashboard')

@app.route('/view/recipe/<int:id>') #A través de la URL recibimos el ID de la receta
def show_recipe(id):
    if 'user_id' not in session: #Solo puede ver la página si ya inició sesión 
        return redirect('/')

    formulario = {
        "id": session['user_id']
    }

    user = User.get_by_id(formulario) #Usuario que inició sesión


    formulario_receta = { "id": id }
    #llamar a una función y debo de recibir la receta
    recipe = Recipe.get_by_id(formulario_receta)

    return render_template('show_recipe.html', user=user, recipe=recipe)

@app.route('/delete/recipe/<int:id>')
def delete_recipe(id):
    if 'user_id' not in session: #Solo puede ver la página si ya inició sesión 
        return redirect('/')
    
    formulario = {"id": id}
    Recipe.delete(formulario)

    return redirect('/dashboard')