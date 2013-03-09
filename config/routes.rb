ForkAndPull::Application.routes.draw do
  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => "videos#index"

  resources :videos, :only => [:show, :index]
  resources :categories, :only => [:show]
  resources :subscribers, :only => [:create]
  resources :donations, :only => [:create]
end
