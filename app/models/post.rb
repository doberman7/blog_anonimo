class Post < ActiveRecord::Base
  has_many :post_tags
	has_many :tags, through: :post_tags


  #errors[:Base] << "No existe ese id" if Post.where(id: looked_post).blank?

  #errors.add(:base, 'error 404 NOT FOUND') if condition

  # self.errors.full_messages





end
