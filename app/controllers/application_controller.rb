class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  get '/recipes' do
    @recipes = Recipe.all
    erb :index
  end

  get '/' do

  end

  get '/recipes/:id' do
    @post = Post.find(params["id"])
    erb :show
  end
end
