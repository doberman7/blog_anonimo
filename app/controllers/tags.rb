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
		 rong_tags = []
		 tag_postIDs = Hash.new
		 ary_whit_input.uniq.each do |tag_name|
			 # find if the tag already exists
			 tags = Tag.where(name: tag_name)

			 if tags.blank?
				 rong_tags << tag_name
				 @errors = "No existir tag:  #{rong_tags*", "}"
			 else
					posts_ids = []
					tags.each do |tag_atribute|
							PostTag.where(tags_id: tag_atribute.id).each do |relation|
								   posts_ids << relation.posts_id
									 tag_postIDs[tag_atribute.name]
							end
							tag_postIDs[tag_atribute.name] =  posts_ids
					end
					p "-"*50
					@tag_postIDs = tag_postIDs
					@posts = []
					posts_ids.each do |id|
						 @posts << Post.find(id)
					end
					p @posts
			 end
		 end
	 else
		 @errors = "ingresa tag"
	 end

	erb :index
end
