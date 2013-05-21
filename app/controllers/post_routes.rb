# Index (display a list of posts)
get '/posts' do
  erb :blog
end

# New (the get action for the new post form)
get '/user/:user_name/posts/new' do
  erb :new_post, :locals => { :post => Post.new }
end

# Create (handle the new form submission)
put '/user/:user_name/posts' do
  new_post = Post.new(:title => params[:title], 
                      :text => params[:text], 
                      :tags => Tag.string_to_tags(params[:string_of_tags]), 
                      :user => User.find(session[:user_id]))
  if new_post.valid?
    new_post.save
    redirect '/posts'
  else
    erb :new_post, :locals => { :post => new_post }
  end
end

# Edit (the get action for update post form)
get '/user/:user_name/posts/:title/edit' do
  
  user = find_user

  post = user.posts.where(title: params[:title]).first if user
  if post
    erb :edit_post, :locals => { :post => post }
  elsif post
    redirect "/posts/#{post.title}"
  else

  end
end

# Update (the submission of updates)
post '/user/:user_name/posts/:title' do

  tags = Tag.string_to_tags(params[:string_of_tags])

  user = find_user
  post = user.posts.where(title: params[:title]).first if user

  post.update_attributes(:title => params[:title], :text => params[:text], :tags => tags)
  redirect '/posts'
end

post '/user/:user_name/posts/:title/remove' do
  user = find_user
  post = user.posts.where(title: params[:title]).first if user

  post.remove
  redirect '/posts'
end

# Read (display a single post)
get '/user/:user_name/posts/:post_title' do
  post = Post.find_by_title(params[:post_title])
  erb :post, :locals => { :post => post }
end



