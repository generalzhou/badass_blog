# require APP_ROOT.join('app', 'helpers')

get '/' do
  # Look in app/views/index.erb

  Post.all.each do |post|
    render_post(post)
  end
  

end


get '/new_post' do

end

get '/post=:post_id' do
  post = Post.find(params[:post_id])
end


