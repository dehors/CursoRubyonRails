Rails.application.routes.draw do
  get 'index' => 'welcome#index'
  #ruta con nombre asignado
  get 'home/index'
  #ruta creada por el comando rails generate controller
  root 'home#index'
  #ruta root del proyecto
end
