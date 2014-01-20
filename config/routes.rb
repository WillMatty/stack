Stack::Application.routes.draw do

  # The routes file matches our URLs up
  # with our controllers

  # I want to add in all the REST urls for the stories
  # e.g. index, show, new , create
  # edit, update, destroy
  resources :stories

end
