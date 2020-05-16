Rails.application.routes.draw do
  # ???/ を???/homeにリダイレクト
  get '/', to: redirect('/home')
  # 全てのアクションを一括管理
  resources :cocktails

  # getリクエスト定義 
  # リクエスト 'URL', to: 'コントローラー名#アクション名'
  get '/home', to: 'home#index'
end
