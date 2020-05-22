class HomeController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @q = Cocktail.ransack(params[:q])
    @cocktails = @q.result(distinct: true)
  end
end
