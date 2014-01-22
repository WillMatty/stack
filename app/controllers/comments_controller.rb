class CommentsController < ApplicationController

  # Add a comment to a story
  def new
    # So not params[:id] as this would refer to a comment
    # we need to find the story by the story_id
    @story = Story.find(params[:story_id])

    # Find the story and make a new comment on that story
    @comment = @story.comments.new
  end

  # Actually get the form data and create a comment
  def create
    @story = Story.find(params[:story_id])

    @comment = @story.comments.new(comment_params)

    if @comment.save
      flash[:success] = "You've added your comment"
      redirect_to story_path(@story)
    else
      render 'new'
    end
  end

  # Let's make a shortcut for grabbing the form data
  # Our whitelist for form data
  def comment_params
    params.require(:comment).permit(:body)
  end
end
