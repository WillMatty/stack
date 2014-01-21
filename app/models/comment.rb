class Comment < ActiveRecord::Base
  # A comment belongs to a story
  # This is our opposite association
  belongs_to :story
  
end
