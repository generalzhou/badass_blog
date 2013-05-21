class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, :through => :post_tags
  belongs_to :user

  validates :title, :text, :tags, :presence => true
  validates_uniqueness_of :title, :scope => :user_id
  
  def tag_names
    tags.map(&:title).join(",")
  end

  def posted_on
    created_at.strftime("%A %B %d, %Y")
  end
end
