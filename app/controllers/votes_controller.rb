class VotesController < ApplicationController

  # Just ceate a vote; no need for new.html.er because it doesn't make much sense
  def create
    # Again, because we're in VOTES controller
    # the story id is found by params[:story_id] (rather than :id)
    @story = Story.find(params[:story_id])

    # *.create instead of *.new, because we don't need to worry
    # about validations
    @vote = @story.votes.create

    flash[:success] = "You've voted"

    if params[:back_to] == 'home'
      # Go to the homepage
      redirect_to root_path
    else
      redirect_to story_path(@story)
    end
  end
end
