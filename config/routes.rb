Rails.application.routes.draw do
  # local...3000にアクセスしたときにcocktailsに誘導する
  root to:  'home#index'
  # 全てのアクションを一括管理
  resources :cocktails
  # getリクエスト定義
  get 'home/index'
end
