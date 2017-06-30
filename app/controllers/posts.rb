# Todas las rutas relacionadas con Post irán en el controlador posts
=begin

	-Mostrar un post determinado.


	-Editar un post existente.
	-Eliminar un post existente.
=end
def show_all_post
	Post.all
end

# -Mostrar todos los posts.
post "/show_all_post" do
	p "<"*50
	p  @all_posts = show_all_post
	p "<"*50
	erb :index
end

# -Crear un post nuevo.
# -Las Tags serán creadas al momento que se creen los Posts.
post "/:postear" do
	# para usert params necesario mismo "name" en "<input", en la vista
	params[:user_post]

end
