enable :sessions
#METODO para mostrar todos los pòst
def show_all_post
	Post.all
end
#metodo para mostrar un post particular
def look_for_post(looked_post)
	# convertir param en un numero entero, si da la busqueda son Strings
	looked_post_integer = looked_post.to_i
	#crear Variables para los errores
	@errors = String.new
	case
	#Determinar si el param es un es un numero, en
	when looked_post_integer != 0
		#en caso de serlo buscar por Id
		@looked_post = Post.where(id: looked_post)
		#if nothing its found
		if @looked_post.blank?			#
			 @errors = "no registros con ese ID"
		end
	#If the param its not a number
	else
		# p "w"*50
		Post.where(autor: looked_post).empty? ? @errors << "Ningun autor " : @looked_post = Post.where(autor: looked_post);
		Post.where(title: looked_post).empty? ? @errors << "Ningun titulo " : @looked_post = Post.where(title: looked_post);
		Post.where(body: looked_post).empty? ? @errors << "Ningun cuerpo " : @looked_post = Post.where(body: looked_post);

		@errors.clear if @looked_post != nil
		# p "w"*50
	end
		erb :index
end

# -Mostrar todos los posts.
get "/show_all_post" do
	@all_posts = show_all_post
	erb :index
end
#-Mostrar un post determinado.
post "/search_post" do
	params[:looked_post]
	look_for_post(params[:looked_post])
end

# -Crear un post nuevo.
# -Las Tags serán creadas al momento que se creen los Posts.
post "/postear" do
	# para usert params necesario mismo "name" en "<input", en la vista
	new_post =  Post.new(autor: params[:post_autor],title: params[:post_title], body: params[:post_body])

	if new_post.valid?
		 new_post.save
		 @saved_post_title = new_post.title
	else
		@errors = new_post.errors.full_messages
		@errors = @errors.join ", "
	end
	erb :index
end

# -Editar un post existente.

post "/edit" do
	p params[:edit_id]
	p post_to_edit =   Post.where(id: params[:edit_id])
	if post_to_edit.blank?
		@errors = "no registros con ese ID"
		erb :index
	else
		@founded = "Encontrado para editar ir a la seccion correspondiente"
		@post_to_edit = post_to_edit
	  erb :index
	end
end

post "/update_post/:post_data_id" do
	@post_to_edit_changed = Post.where(id: params[:post_data_id]).update(autor: params[:update_post_autor] ,title: params[:update_post_title], body: params[:update_post_body])
	erb :index
end

# 	-Eliminar un post existente.
post "/delete" do
	post_to_edit =  Post.find_by(id: params[:p_id])
	if post_to_edit.blank?
		@errors = "no registros con ese ID"
		erb :index
	else
		p post_to_edit.destroy
		@founded = "Encontrado y eliminado"
	  erb :index
	end
end
