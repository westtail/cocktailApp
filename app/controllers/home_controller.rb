class HomeController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end
end
