#Todas las rutas relacionadas con Tag irán en el controlador tags.
#Mostrar todos los posts con cierto Tag.
#Las Tags serán creadas al momento que se creen los Posts.

after "/postear" do
	 tags = params[:post]
	p tags
		# unless params[:tag].empty?
		# 	tag = Tag.find_by(name: params[:tag])
		# 	if tag.blank?
		# 		tag = Tag.new(name: params[:tag])
		# 		tag.save
		# 		tag =  Tag.last
		# 		post = Post.last
		# 		p PostTag.create!(tags_id: tag.id, posts_id: post.id)
		# 	else
		# 		p "<"*50
		# 		p tag
		# 		post = Post.last
		# 		p PostTag.create!(tags_id: tag.id, posts_id: post.id)
		# 		p "<"*50
		# 	end
		# 	p PostTag.where(name: params[:tag])
		# end
end
