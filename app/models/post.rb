class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, :through => :post_tags

  validates :title, :presence => true, :uniqueness => true
  validates :text, :presence => true 
  validates :tags, :presence => true 

  def tag_names
    tags.map(&:tag_name).join(",")
  end

  def posted_on
    created_at.strftime("%A %B %d, %Y")
  end
end
