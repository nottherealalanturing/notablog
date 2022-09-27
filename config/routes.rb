Rails.application.routes.draw do
  devise_for :users
  get 'comments/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  puts "/posts/:id/like", to: "posts#like", as: "like"

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show, :new] do
      resources :comments, only: [:create]
    end
  end

  resources :posts do
    resources :comments, only: [:create, :new]
  end
  
end

