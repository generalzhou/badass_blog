class Tag < ActiveRecord::Base
  has_many :post_tags
  has_many :posts, :through => :post_tags

  validates :title, :presence => true, :uniqueness => true, :format => /\w/

  def self.string_to_tags(string)
    string.chomp.gsub(' ','').split(',').map do |tag|
      Tag.find_or_create_by_title(tag.chomp.downcase.strip)
    end
  end
end
