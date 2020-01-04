require 'pry'
class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    2.times {@recipe.ingredients.build}
  end

  def create
    @recipe = Recipe.new(recipe_params)
#raise @recipe.inspect
#binding.pry
    if @recipe.save
      redirect_to @recipe
    else
      render :new
    end
  end

  def recipe_params
    params.require(:recipe).permit(:title,  
                                  ingredients_attributes:[
                                    :name,
                                    :quantity])
  end
end
