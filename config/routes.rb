Rails.application.routes.draw do
  
  resources :events, only: [:index]

  resources :events, only: [:index, :create, :update, :destroy], path: '/api/events', defaults: {format: :json}

  resources :categories

  resources :articles do 
  resources :comments, only: [:create, :destroy, :update]
  end

  devise_for :users
  get 'index' => 'home#index'
  #ruta con nombre asignado
  get 'home/index'
  #ruta creada por el comando rails generate controller
  root 'home#index'
  #ruta root del proyecto

  get 'dashboard'  => 'home#dashboard'
  get "/articles/:id/publish", to: "articles#publish"
  get "/articles/:id/in_draft", to: "articles#draft"

end
