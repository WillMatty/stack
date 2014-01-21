class Story < ActiveRecord::Base

  validates :title, length: { minimum: 5 }
  validates :description, presence: true
  validates :url, presence: true, uniqueness: { message: 'No reposts!' }

end
