#Todas las rutas relacionadas con Tag irán en el controlador tags.

#Las Tags serán creadas al momento que se creen los Posts.
after "/postear" do

		unless params[:post][:tags].empty?
			# access to the values of the hass params throw the keys
		  input_in_the_form = params[:post][:tags]
			# separate the input throw a regex with comas, ignoring black spaces and put in a Ary
			ary_whit_input = input_in_the_form.split (/\s*,\s*/)
			# itarate throw the ary
			ary_whit_input.each do |tag_name|
				# find if the tag already exists
				tag = Tag.find_by(name: tag_name)
				# if not already exists
				if tag.blank?
					# create a new tag
					tag = Tag.create!(name: tag_name)
				end
				# retrieve the last post
				last_post = Post.last
				# create the Join relation with tha tag id and ths post id
				PostTag.create!(tags_id: tag.id, posts_id: last_post.id)
			end

		end
end

#Mostrar todos los posts con cierto Tag.
post "/show_tag" do


	 unless params[:tags][:searched_tag].empty?
		 # access to the values of the hass params throw the keys
		 input_in_the_form = params[:tags][:searched_tag]
		 # separate the input throw a regex with comas, ignoring black spaces and put in a Ary
		 ary_whit_input = input_in_the_form.split (/\s*,\s*/)
		 # itarate throw the ary
		 ary_whit_input.uniq.each do |tag_name|
			 # find if the tag already exists


			 p tags = Tag.where(name: tag_name)
			 # if not already exists
			 if tags.blank?
				 # create a new tag
				 @errors = "No existe tag:  #{tag_name}"
			 else
				 tags.each do |tag|
					 	tag
				 end
			 end


		 end

	 end

	erb :index
end
