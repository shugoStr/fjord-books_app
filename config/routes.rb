Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_for :users
  root to: 'books#index'
  resources :books
  resources :users, only: %i(index show) do
    resources :followings, only: :index, module: :users
    resources :followers, only: :index, module: :users
  end
  resources :friendships, only: %i(create destroy)
end
