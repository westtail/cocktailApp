Rails.application.routes.draw do
  # local...3000にアクセスしたときにcocktailsに誘導する
  root to: 'cocktails#index'
  # 全てのアクションを一括管理
  resources :cocktails
end
