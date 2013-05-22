helpers do

  def find_user
    if session[:user_id].nil? || User.find(session[:user_id]).nil?
      false
    else
      User.find(session[:user_id])
    end
  end

  def print_errors(object)
    if object
      object.errors.full_messages.inject('') do |message, error|
        message + "<h4 class='return_message'>#{error}</h4>"
      end
    end
  end
end
