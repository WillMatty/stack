class Story < ActiveRecord::Base

  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 1 }
  validates :url, presence: true, uniqueness: { message: 'No reposts!' }

  # I want to overwrite the url structure in ActiveRecord
  # ActiveRecord is the Rails way to manage models
  # to_params is the method we want to overwrite
  # I want my title to be something link 7-designer-news
  # This is my ID then my title as a url
  
  def to_param
  	"#{id}-#{title.parameterize}"
  end

end
