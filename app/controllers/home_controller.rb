class HomeController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @q = Cocktail.ransack(params[:q])
    #→(params[:q])に検索パラメーターが入り、Cocktailテーブルを検索する@qオブジェクトが生成される。
    @cocktails = @q.result(distinct: true).page(params[:page]).per(5)
    #distinct: trueで重複データがまとまる 
    # page(params[:page])でページネーション
  end
end
