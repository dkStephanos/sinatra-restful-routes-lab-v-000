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

  delete '/recipes/:id/delete' do
    Recipe.delete(params["id"])
    erb :index
  end

  get '/recipes/:id' do
    @recipe = Recipe.find(params["id"])
    erb :show
  end

  get '/recipes/:id/edit' do
    @recipe = Recipe.find(params["id"])
    erb :edit
  end

  patch '/recipes/:id' do
    #binding.pry
    @recipe = Recipe.find(params["id"])
    @recipe.name = params["name"]
    @recipe.content = params["content"]
    @recipe.save
    erb :show
  end

end
