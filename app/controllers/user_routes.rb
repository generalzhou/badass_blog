get '/user/create' do
  erb :create_account, :locals => {:user => nil }
end

post '/user/create' do
  new_user = User.new(params)
  if new_user.valid?
    new_user.save
    session[:user_id] = new_user.id
    redirect "/user/#{new_user.user_name}"
  else
    erb :create_account, :locals => { :user => new_user }
  end
end

post '/user/login' do 
  if user = User.authenticate(params)
    session[:user_id] = user.id
    session[:user_name] = user.user_name
    redirect "/user/#{user.user_name}"
  else
    erb :failed_login
  end
end

get '/user/edit_profile' do
  erb :edit_profile
end

get '/user/logout' do 
  session.clear
  redirect '/posts'
end

get '/user/:user_name' do
  user = User.find_by_user_name(params[:user_name])
  if user 
    user_id = user.id
    erb :user_profile, :locals => {:user_id => user_id}
  else
    erb :cant_find_user, :locals => { :user_name => params[:user_name] }
  end
end
