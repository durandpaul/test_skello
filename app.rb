require "sinatra"
require "sinatra/reloader" if development?
require_relative 'database'

def add_comm_to_db(val, user, id)
  if user === ""
    user = 'Inconnu'
  end
  COMMENTS[id].push({comm: val, user: user}) 
end

get "/" do
  @articleList = DB
  erb :index
end

get "/article/:index" do
  @index = Integer(params[:index])
  if DB.length > @index
    @commentList = COMMENTS[@index]
    @theArticle = DB[@index]
    # "@commentList, #{@commentList}"
    erb :article
  else
    redirect '/'  
  end
end

post "/addComm" do

  index = Integer(params[:id])
  add_comm_to_db(params[:content], params[:pseudo], index)
  # "hello #{params[:content]}"
  redirect "/article/#{params[:id]}"
end


not_found do
  status 404
  'not found'
end