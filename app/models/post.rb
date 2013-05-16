class Post < ActiveRecord::Base
  has_many :post_tags
  has_many :tags, :through => :post_tags

  def tag_names
    tags.map(&:tag_name).join(",")
  end
end
