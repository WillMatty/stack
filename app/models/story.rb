class Story < ActiveRecord::Base

  # This is a connection in rails
  # Our story has many comments AND has many votes
  has_many :comments
  has_many :votes

  # Set up acts-as-taggable-on (tags)
  acts_as_taggable


  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 1 }
  validates :url, presence: true, uniqueness: { message: 'No reposts!' }

  # I want to overwrite the url structure in ActiveRecord
  # ActiveRecord is the Rails way to manage models
  # to_param is the method we want to overwrite
  # I want my title to be something link 7-designer-news
  # This is my ID then my title as a url

  def to_param
    "#{id}-#{title.to_url}"
  end

  # This is my OWN shortcut to make nice clean URLs for our users
  def nice_url
    # I want to take the URL
    # and I want to remove http://
    # and I want to remove www.
    # gsub is global substitution
    url.gsub('http://', '').gsub('www.', '')
    # url.gsub(%r(http://)|(www\.), '')
  end

end
