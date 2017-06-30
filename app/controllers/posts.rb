=begin

	-Editar un post existente.
	-Eliminar un post existente.
=end
def show_all_post
	Post.all
end



def look_for_post(looked_post)
	looked_post_integer = looked_post.to_i
	@errors = String.new
	case
	when looked_post_integer != 0
		@looked_post = Post.where(id: looked_post)
		if @looked_post.blank?
			 @errors = "no registros con ese ID"
		end
	else
		p "w"*50
		Post.where(autor: looked_post).empty? ? @errors << "Ningun autor " : @looked_post = Post.where(autor: looked_post);
		Post.where(title: looked_post).empty? ? @errors << "Ningun titulo " : @looked_post = Post.where(title: looked_post);
		Post.where(body: looked_post).empty? ? @errors << "Ningun cuerpo " : @looked_post = Post.where(body: looked_post);

		@errors.clear if @looked_post != nil
		p "w"*50


	end
		erb :index
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
