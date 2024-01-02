Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }


  root 'posts#index'
  
  resources :posts do
    resources :comments, only: [:create, :destroy]
    resources :likes
  end

  resources :comments do
    resources :likes
  end

  get 'pages/index'

end


