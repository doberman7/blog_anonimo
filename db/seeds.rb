require "faker"

10.times do
	p Post.create!(autor: Faker::Friends.character,title: Faker::Music.instrument, body: Faker::ChuckNorris.fact)
end

10.times do
	p Tag.create!(name: Faker::Name.unique.name)
end

10.times do
	p PostTag.create!(tags_id: Faker::Number.between(1, 10),posts_id: Faker::Number.between(1, 10))
end
