Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show)

  # フォロー数とフォロワー数表示
  resources :users do
    resources :followings, only: :index, module: 'users'
    resources :followers, only: :index, module: 'users'
  end

  # フォローと解除のための中間テーブル用(1対1)
  resource :friendships, only: %i[create destroy]
end
