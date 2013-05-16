helpers do

  def render_post(post)
    erb :_post, :locals => {:post_id => params[:post_id], :title => 'Title!', :text => 'Text text', :tags => 'tags'}
  end

end
