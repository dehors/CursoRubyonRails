Rails.application.routes.draw do
  
  resources :categories

  devise_for :users
  get 'index' => 'home#index'
  #ruta con nombre asignado
  get 'home/index'
  #ruta creada por el comando rails generate controller
  root 'home#index'
  #ruta root del proyecto

  get 'dashboard'  => 'home#dashboard'
  put "/articles/:id/publish", to: "articles#publish"

  resources :articles do 
	resources :comments, only: [:create, :destroy, :update]
  end
end
