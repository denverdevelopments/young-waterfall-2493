class Movie < ApplicationRecord
  validates_presence_of :title
  validates_presence_of :creation_year
  validates_numericality_of :creation_year
  validates_presence_of :genre

  belongs_to :studio

  has_many :actor_movies
  has_many :actors, through: :actor_movies

end
