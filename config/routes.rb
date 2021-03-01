Rails.application.routes.draw do
  resources :twats
#  devise_for :users
  devise_for :users, controllers: {registrations: 'users/registrations'}
  #Este era el ejemplo que decia el terminal cuando se creo el controlador devise:users
  #    devise_for :users, controllers: {
#        sessions: 'users/sessions'
#      }

  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
