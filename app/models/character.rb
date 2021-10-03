class Character < ApplicationRecord
  # model association
  has_and_belongs_to_many :movies

  # validations
  validates_presence_of :name, :age, :weight, :history, :image, :movies

  def save_movies
    self.movies.each do | movie |
      CharactersMovie.create(character: self, movie: movie)
    end
  end
end
