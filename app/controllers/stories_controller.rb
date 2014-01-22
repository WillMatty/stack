class StoriesController < ApplicationController

  # Controllers manage the urls,
  # the data from the models, and our HTML views

  # Before we run the show, edit, update and destroy
  # Let's find the story we're talking about
  before_action :find_story, only: [:show, :edit, :update, :destroy]

  def index
    # Set the variable @stories
    # to all the records in our story database table

    # if it has ?sort=recent in the url, then sort by created_at
    # else show the popilar ones
    if params[:sort] == 'recent'
      # sort by created_at
      @stories = Story.order('created_at desc')
    elsif params[:sort] == 'featured'
      @stories = Story.where(is_featured: true)
                      .order('is_featured desc, votes_count desc')
    else
      # sort by popular
      @stories = Story.order('votes_count desc, created_at desc')
    end

    # Add in my pagination
    # Overwrite the @stories variable with a paginated version
    @stories = @stories.page(params[:page]).per(5)

  end

  # This is the individual story page
  def show
    # params[:id] is the number in the url we are looking for
    # @story = Story.find(params[:id])
  end

  def new
    # @story is made an instance of Story class
    @story = Story.new
  end

  # This is where the form data from the new.html.erb view goes
  def create
    @story = Story.new(story_params)

    if @story.save
      # Let's add a flash of content to tell the user we've added this
      flash[:success] = "You've added a link! Yay!"

      # Go back to the home page
      redirect_to root_path

    else
      render 'new'
    end
  end

  def edit
    # @story = Story.find(params[:id])
  end

  # Actually update the database
  def update
    # @story = Story.find(params[:id])

    if @story.update(story_params)
      flash[:success] = "Yay! You've updated this story"

      redirect_to story_path(@story)
    else
      render 'edit'
    end
  end

  # Actually destroy the record in the database
  def destroy
    # @story = Story.find(params[:id])

    @story.destroy

    flash[:success] = "You've deleted this story"

    redirect_to root_path
  end

  # Shortcut for getting form data
  def story_params
    params.require(:story).permit(:title, :description, :url)
  end

  # Shortcut for finding the story from the url
  # find_story isn't part of rails, it's something we made ourselves
  def find_story
    @story = Story.find(params[:id])
  end

end
