class CocktailsController < ApplicationController
  def index
    @q = Cocktail.ransack(params[:q])
    @cocktails = @q.result(distinct: true).page(params[:page]).per(5)
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end
end
