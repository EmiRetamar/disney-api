class Character < ApplicationRecord
  # model association
  has_and_belongs_to_many :movies

  # validations
  validates_presence_of :name, :age, :weight, :history, :image

  def save_movies(movies)
    movies.each do |movie_id|
      movie = Movie.find(movie_id)
      CharactersMovies.create!(character: self, movie: movie)
    end
  end
end
