class StoriesController < ApplicationController

  # Controllers manage the urls,
  # the data from the models, and our HTML views

  def index
    @username = 'willmatty'
    @now = Time.now

    # Hard_coded == bad? => true
    # @stories = ['Google', 'Facebook', 'LinkedIn', 'Twitter']

    # Set the variable @stories
    # to all the records in our story database table
    @stories = Story.all
  end
  
end
