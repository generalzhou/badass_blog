# require APP_ROOT.join('app', 'helpers')

get '/' do
  redirect to("/posts")
end

# Index (display a list of posts)
get '/posts' do
  erb :blog
end

# New (the get action for the new post form)
get '/posts/new' do
  erb :new_post, :locals => { :post => Post.new }
end

put '/posts/validate' do
  if string_to_tags_invalid?(params[:string_of_tags])
    return "Please insert at least one valid tag" 
  elsif Post.new(title: params[:title], text: params[:text], :tags => [Tag.new(tag_name: 'dummy')]).invalid?
    return "Please make sure that you fill out the title and body fields and that your title is unique"
  else
    return "Successfully saved!"
  end
end

# Create (handle the new form submission)
put '/posts' do

  tags = string_to_tags(params[:string_of_tags])
  new_post = Post.new(:title => params[:title], :text => params[:text], :tags => tags)
  new_post.save if new_post.valid?
  redirect '/posts'
end

# Edit (the get action for update post form)
get '/posts/:id/edit' do
  post = Post.find(params[:id])
  erb :edit_post, :locals => { :post => post }
end

# Update (the submission of updates)
post '/posts/:id' do

  tags = string_to_tags(params[:string_of_tags])

  post = Post.find(params[:id])
  post.update_attributes(:title => params[:title], :text => params[:text], :tags => tags)
  redirect '/posts'
end

post '/posts/:id/remove' do
  Post.find(params[:id]).remove
  redirect '/posts'
end

# Read (display a single post)
get '/posts/:id' do
  post = Post.find(params[:id])
  erb :post, :locals => { :post => post }
end



