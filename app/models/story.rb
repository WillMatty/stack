class Story < ActiveRecord::Base

  validates :title, length: { minimum: 5 }
  validates :description, length: { minimum: 1 }
  validates :url, presence: true, uniqueness: { message: 'No reposts!' }

end
