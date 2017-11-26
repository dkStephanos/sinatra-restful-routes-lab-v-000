require 'pry'

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
    @recipe = Recipe.find(params["id"])
    erb :show
  end

  get 'recipes/:id/delete' do
    binding.pry
    Recipe.delete(params["id"])
    erb :index
  end
end
