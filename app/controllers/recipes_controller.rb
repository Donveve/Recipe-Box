class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end
  # Create new recipe object
  # call .recipe_ingredients.new ON the new object
  # iterate through params given of ingredient form and assign to recipe_ingredients where correct!

  # Recipe.first.recipe_ingredients.includes(:ingredient, :metric, :amount).each {|x| p x.ingredient; p x.metric; p x.amount }

  def new
    @recipe = Recipe.new
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user_id = current_user.id

    if @recipe.save
      redirect_to @recipe
    else
      render :action => 'new'
    end

  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(params[:recipe])
      redirect_to @recipe
    else
      render :action => 'edit'
    end
  end

  def destroy
  end

private
  def recipe_params
    params.require(:recipe).permit(:title, :summary, :difficulty, :prep_time, :instructions, :category_id, :user_id)
  end
end


