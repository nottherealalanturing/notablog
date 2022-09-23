Rails.application.routes.draw do
  get 'comments/create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"

  resources :users, only: [:index, :show] do 
    resources :posts, only: [:index, :show] do
      resources :comments, only: [:create]
    end
  end

  resources :posts do
    resources :comments, only: [:create]
  end
end
