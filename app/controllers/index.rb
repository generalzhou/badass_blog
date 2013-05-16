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

# Create (handle the new form submission)
put '/posts' do
  tags = params[:tags].split(',').map do |tag|
    Tag.find_or_create_by_tag_name(tag.chomp.downcase.strip)
  end
  Post.create(:title => params[:title], :text => params[:text], :tags => tags)
  redirect '/posts'
end

# Edit (the get action for update post form)
get '/posts/:id/edit' do
  post = Post.find(params[:id])
  erb :edit_post, :locals => { :post => post }
end

# Update (the submission of updates)
post '/posts/:id' do
  tags = params[:tags].split(',').map do |tag|
    Tag.find_or_create_by_tag_name(tag.chomp.downcase)
  end
  post = Post.find(params[:id])
  post.update_attributes(:title => params[:title], :text => params[:text], :tags => tags)
  redirect '/posts'
end

# Read (display a single post)
get '/posts/:id' do
  post = Post.find(params[:id])
  erb :post, :locals => { :post => post }
end



