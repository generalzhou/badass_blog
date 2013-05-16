helpers do

  def render_post(post)
    erb :_post, :locals => {:post_id => post.id, :title => post.title, :text => post.text, :tags => post.tags}
  end

end
