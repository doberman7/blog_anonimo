#Todas las rutas relacionadas con Tag irán en el controlador tags.
#Mostrar todos los posts con cierto Tag.
#Las Tags serán creadas al momento que se creen los Posts.

after "/postear" do

		unless params[:post][:tags].empty?

		  input_in_the_form = params[:post][:tags]
			ary_whit_input = input_in_the_form.split (/\s*,\s*/)
			ary_whit_input.each do |tag_name|

				tag = Tag.find_by(name: tag_name)
				if tag.blank?
					tag = Tag.create!(name: tag_name)
				end
				last_post = Post.last
				new_tag = PostTag.create!(tags_id: tag.id, posts_id: last_post.id)
				p "s"*50
				p new_tag
				p "s"*50
			end

		end
end

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
