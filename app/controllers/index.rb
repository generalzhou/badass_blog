# require APP_ROOT.join('app', 'helpers')

get '/' do
  redirect to("/posts")
end

