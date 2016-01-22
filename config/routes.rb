Rails.application.routes.draw do
  resources :comments

  devise_for :users
  get 'index' => 'home#index'
  #ruta con nombre asignado
  get 'home/index'
  #ruta creada por el comando rails generate controller
  root 'home#index'
  #ruta root del proyecto

  resources :articles
end
