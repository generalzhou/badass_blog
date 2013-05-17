helpers do
  def string_to_tags(string)
    string.chomp.gsub(' ','').split(',').map do |tag|
      Tag.find_or_create_by_tag_name(tag.chomp.downcase.strip) if tag =~ /\w/
    end
  end

  def string_to_tags_invalid?(string)
    string.chomp.gsub(' ','').split(',').none? { |tag| tag =~ /\w/ }
  end
end
