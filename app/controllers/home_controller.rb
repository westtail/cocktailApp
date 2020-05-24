class HomeController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @q = Cocktail.ransack(params[:q])
    #→(params[:q])に検索パラメーターが入り、Cocktailテーブルを検索する@qオブジェクトが生成される。
    @cocktails = @q.result(distinct: true)
    #distinct: trueで重複データがまとまる
  end
end
