class Actor < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :age
  validates_numericality_of :age
  # validates :working, inclusion: { in: [ true, false ] }
  # validates_presence_of :working, inclusion: [true, false]


  has_many :actor_movies
  has_many :movies, through: :actor_movies
end
