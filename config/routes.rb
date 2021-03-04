Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :twats
#  devise_for :users
  devise_for :users, controllers: {registrations: 'users/registrations'}
  #Este era el ejemplo que decia el terminal cuando se creo el controlador devise:users
  #    devise_for :users, controllers: {
#        sessions: 'users/sessions'
#      }

  root 'home#index'
  put '/twats/:id/like', to: 'twats#like', as: 'like'

  namespace :api do
    resources :news , only: [:index, :create] #, :show, :create, :update, :destroy]
  end

end
