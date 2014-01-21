class StoriesController < ApplicationController
  # Controllers manage the urls,
  # the data from the models, and our HTML views

  def index
    @username = 'willmatty'
    @now = Time.now

    # Set the variable @stories
    # to all the records in our story database table
    @stories = Story.order('created_at desc')
  end

  # This is the individual story page
  def show
    # params[:id] is the number in the url we are looking for
    @story = Story.find(params[:id])
  end

  def new
    # @story is made an instance of Story class
    @story = Story.new
  end

  # This is where the form data from the new.html.erb view goes
  def create
    @story = Story.new(story_params)

    @story.save

    # Let's add a flash of content to tell the user we've added this
    flash[:success] = "You've added a link! Yay!"

    # Go back to the home page
    redirect_to root_path
  end

  def edit
    @story = Story.find(params[:id])
  end

  # Actually update the database
  def update
    @story = Story.find(params[:id])

    @story.update(story_params)

    flash[:success] = "Yay! You've updated this story"

    redirect_to story_path(@story)
  end

  # Actually destroy the record in the database
  def destroy
    @story = Story.find(params[:id])

    @story.destroy

    flash[:success] = "You've deleted this story"

    redirect_to root_path
  end

  # Shortcut for getting form data
  def story_params
    params.require(:story).permit(:title, :description, :url)
  end

end
