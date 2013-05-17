get '/user/create' do
  erb :create_account
end

post '/user/create' do

end

post '/user/login' do 
  if user = User.authenticate(params)
    session[:user_id] = user.id
    redirect "/user/#{user.id}"
  else
    erb :failed_login
  end
end

get '/user/profile' do

end
