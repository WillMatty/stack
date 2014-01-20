class StoriesController < ApplicationController

  # Controllers manage the urls,
  # the data from the models, and our HTML views

  def index
    @username = 'willmatty'
    @now = Time.now

    @stories = ['Google', 'Facebook', 'LinkedIn', 'Twitter']
  end
end
