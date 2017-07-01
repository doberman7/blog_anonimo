class Post < ActiveRecord::Base
  has_many :post_tags
	has_many :tags, through: :post_tags

  validates :autor, :presence => true
  validates :title, :presence => true
  validates :body, :presence => true

  #errors[:Base] << "String message" if condition
  #errors.add(:base, 'error 404 NOT FOUND') if condition  
  #  self.errors.full_messages







end
