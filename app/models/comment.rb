require 'obscenity/active_model'

class Comment < ActiveRecord::Base
  # A comment belongs to a story
  # This is our opposite association
  belongs_to :story

  # Validations
  validates :body, length: { minimum: 20 }, obscenity: { 
  		sanitize: true,
  		replacement: :vowels }
  
end
