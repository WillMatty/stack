Stack::Application.routes.draw do

  # URLs dor ActiveAdmin (automatically added by ActiveAdmin)
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # The routes file matches our URLs up
  # with our controllers

  # I want to add in all the REST urls for the stories
  # e.g. index, show, new , create
  # edit, update, destroy
  resources :stories do
    # This is called a nested resource
    # basically meaning the URLs for comments are on the URLs for stories
    resources :comments

    # Because votes are related to stories, just like comments
    resources :votes
  end

  # let's add in a homepage
  root 'stories#index'

end
