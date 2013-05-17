helpers do
  def string_to_tags(string)
    string.chomp.gsub(' ','').split(',').map do |tag|
      Tag.find_or_create_by_title(tag.chomp.downcase.strip) if tag =~ /\w/
    end
  end

  def string_to_tags_invalid?(string)
    string.chomp.gsub(' ','').split(',').none? { |tag| tag =~ /\w/ }
  end

  def logged_in?
    session[:user_id]
  end

  def get_user
    User.find(session[:user_id])
  end


  def log_in(user_id)
    session[:user_id] = user_id
  end

  def log_out
    session.clear
  end
end
