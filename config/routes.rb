Stack::Application.routes.draw do

  # I want to add in all the REST urls for the stories
  # e.g. index, show, new , create
  # edit, update, destroy
  resources :stories

end
