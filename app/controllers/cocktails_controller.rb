class CocktailsController < ApplicationController
  def index
    check_cocktail_params
    # paramsでURLパラメータを取得 [:q]のパラメータ
    @q = Cocktail.ransack(params[:q])
    @cocktails = @q.result(distinct: true).page(params[:page]).per(5)
  end
  
  def show
    check_cocktail_params
    @cocktail = Cocktail.find(params[:id])
  end

  private

  helper_method :cocktail_params

  def cocktail_params
    {:"q"=>{"name_cont"=>@name,
            "base_alcohol_cont"=>@base_alcohol,
            "taste_cont"=>@taste,
            "glass_type_cont"=>@glass_type,
            "alcohol_percentage_gteq"=>@alcohol_percentage_gteq,
            "alcohol_percentage_lteq"=>@alcohol_percentage_lteq,}}
  end

  def check_cocktail_params
    @q = params[:q]
    if @q.nil? == false then
      @name = params[:q][:name_cont]
      @base_alcohol= params[:q][:base_alcohol_cont]
      @taste = params[:q][:taste]
      @glass_type = params[:q][:glass_type]
      @alcohol_percentage_gteq = params[:q][:alcohol_percentage_gteq]
      @alcohol_percentage_lteq = params[:q][:alcohol_percentage_lteq]
    end
    
  end
end
