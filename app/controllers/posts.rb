# require 'sinatra'
# set :show_exceptions, false
# Todas las rutas relacionadas con Post irán en el controlador posts
=begin

	-Editar un post existente.
	-Eliminar un post existente.
=end
def show_all_post
	Post.all
end

# error do
# 	@looked_post = @looked_post.errors.full_messages
# end

def look_for_post(looked_post)
	looked_post_integer = looked_post.to_i
	case
	when looked_post_integer != 0
		@looked_post = Post.where(id: looked_post)
		if @looked_post.blank?
			#errors[:base] << "Ninguno con ese id" : false;
			p @errors = "no registros"
			erb :index
		end
	else
		@looked_post = Post.where(autor: looked_post)
		@looked_post.empty?
	end

end

# -Mostrar todos los posts.
get "/show_all_post" do
	@all_posts = show_all_post
	erb :index
end
#-Mostrar un post determinado.
post "/show_specific_post" do
	look_for_post(params[:looked_post])
end

# -Crear un post nuevo.
# -Las Tags serán creadas al momento que se creen los Posts.
post "/:postear" do
	# para usert params necesario mismo "name" en "<input", en la vista
	params[:user_post]

end
