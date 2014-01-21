Stack::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The routes file matches our URLs up
  # with our controllers

  # I want to add in all the REST urls for the stories
  # e.g. index, show, new , create
  # edit, update, destroy
  resources :stories

  # let's add in a homepage
  root 'stories#index'

end
