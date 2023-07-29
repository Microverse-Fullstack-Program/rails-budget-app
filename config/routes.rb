Rails.application.routes.draw do
  devise_for :users
  root "home#index"

  resources :categories do
    resources :entities
  end

  devise_scope :user do
    get 'logout', to: 'devise/sessions#destroy'
  end

end
