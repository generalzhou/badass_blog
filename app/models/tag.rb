class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags

  validates :tag_name, :presence => true, :uniqueness => true

end
