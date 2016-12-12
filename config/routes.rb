Rails.application.routes.draw do

  resources :users
  resources :posts do
    resources :comments, only: [:new]
  end
  resources :subs

  resources :comments, except: [:new] do
    resources :comments
  end

  resource :session
end
