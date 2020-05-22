class CocktailsController < ApplicationController
  def index
    @q = Cocktail.ransack(params[:q])
    @cocktails = @q.result(distinct: true)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end
end
