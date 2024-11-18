Rails.application.routes.draw do
  devise_for :users
  resources :articles
    root "articles#index"

    resources :photos

    resources :articles do
      resources :comments, only: [:create, :edit, :update, :destroy, :show]
    end

end
